"""Create (or update) the Gross–Wilson K3 mission proposal on Prove2Me.

Run from the workspace root:  python3 tools/upload_proposal.py
State (proposal and item ids) is kept in tools/proposal_state.json so reruns update in place.
"""
import json
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from tools.p2m import api  # noqa: E402
from tools import proposal_content as C  # noqa: E402

HERE = os.path.dirname(os.path.abspath(__file__))
STATE = os.path.join(HERE, "proposal_state.json")
READBACK_MODEL = "claude-opus-5-5"
FIELDS = {
    "Differential Geometry": "7d463ec3-5469-48c2-8c10-6ee07e62d0f4",
    "Algebraic Geometry": "d311bb23-6a7a-4f34-9f38-e55cf9e9c179",
}
ORDER = [
    "def_Geometry", "def_Distances", "def_GromovHausdorff", "def_OoguriVafa",
    "def_CanonicalCoords",
    "thm_prop_2_8",
    "thm_lemma_3_1_a", "thm_lemma_3_1_b", "thm_lemma_3_1_c", "thm_lemma_3_1_d",
    "thm_lemma_4_1_a", "thm_lemma_4_1_b",
    "thm_thm_6_4",
]
GOAL = "thm_thm_6_4"
TAGS = ["k3-surfaces", "mirror-symmetry", "kahler-geometry", "gromov-hausdorff", "syz"]


def check(status, body, what):
    if status not in (200, 201, 204):
        print(f"FAILED {what}: HTTP {status}: {json.dumps(body)[:1500]}")
        sys.exit(1)
    return body


state = json.load(open(STATE)) if os.path.exists(STATE) else {}

meta = {
    "name": C.NAME,
    "description": C.DESCRIPTION.strip(),
    "mission_type": "ResearchPaper",
    "field_ids": list(FIELDS.values()),
}
if "proposal_id" not in state:
    body = check(*api("POST", "/mission-proposals", dict(meta, visibility="public")), "create proposal")
    state["proposal_id"] = body["id"]
else:
    check(*api("PATCH", f"/mission-proposals/{state['proposal_id']}", meta), "update proposal")
pid = state["proposal_id"]
json.dump(state, open(STATE, "w"), indent=2)
print("proposal", pid)

items = state.setdefault("items", {})
for key in ORDER:
    spec = json.load(open(os.path.join(HERE, "items", f"{key}.json")))
    text = C.ITEMS[key]
    readback = open(os.path.join(HERE, "readbacks", f"{key}.md")).read().strip()
    if spec["kind"] == "definition":
        payload = {
            "kind": "definition",
            "definition_name": spec["name"],
            "definition_title": text["title"],
            "definition": spec["code"],
        }
    else:
        payload = {
            "kind": "theorem",
            "theorem_name": spec["name"],
            "theorem_title": text["title"],
            "formal_statement": spec["formal_statement"],
            "preamble": spec["preamble"],
        }
    payload.update(
        natural_language_statement=text["nl"].strip(),
        source=text["source"],
        tags=TAGS,
        readback=readback,
        readback_model=READBACK_MODEL,
    )
    if key in items:
        upd = {k: v for k, v in payload.items() if k != "kind"}
        check(*api("PATCH", f"/mission-proposals/{pid}/items/{items[key]}", upd), f"update item {key}")
    else:
        body = check(*api("POST", f"/mission-proposals/{pid}/items", payload), f"add item {key}")
        items[key] = body["id"]
    json.dump(state, open(STATE, "w"), indent=2)
    print("item", key, items[key])

check(
    *api(
        "PATCH",
        f"/mission-proposals/{pid}",
        {"main_item_id": items[GOAL], "item_order": [items[k] for k in ORDER]},
    ),
    "set goal and order",
)
print("goal and order set")

ALL_MILESTONES = {**C.MILESTONES, **C.MILESTONES_NEW}
for key in [k for k in ORDER if k in ALL_MILESTONES]:
    title, desc = ALL_MILESTONES[key]
    check(
        *api(
            "POST",
            f"/mission-proposals/{pid}/milestones",
            {"item_id": items[key], "milestone_title": title, "milestone_description": desc},
        ),
        f"milestone {key}",
    )
    print("milestone", key)

status, body = api("GET", f"/mission-proposals/{pid}")
check(status, body, "read back proposal")
print("status", body.get("status"), "| items", len(body.get("items", [])),
      "| main", body.get("main_item_id") == items[GOAL])
