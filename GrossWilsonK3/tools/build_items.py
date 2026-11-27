"""Build proposal item payloads (and comment-free auditor copies) from the local Lean files.

Writes tools/items/<key>.json with fields:
  kind, name, code (definition) | preamble + formal_statement (theorem),
  audit_text: the Lean code with all comments/docstrings removed, plus the
  (comment-free) code of every GrossWilsonK3 definition file it imports.
"""
import json
import os
import re

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT = os.path.join(ROOT, "tools", "items")
os.makedirs(OUT, exist_ok=True)

DEFS = ["Geometry", "Distances", "GromovHausdorff", "OoguriVafa", "CanonicalCoords"]
THMS = ["thm_6_4", "lemma_3_1_a", "lemma_3_1_b", "lemma_3_1_c", "lemma_3_1_d", "prop_2_8", "lemma_4_1_a", "lemma_4_1_b"]


def strip_comments(code):
    code = re.sub(r"/-.*?-/", "", code, flags=re.S)
    code = re.sub(r"--[^\n]*", "", code)
    code = re.sub(r"\n\s*\n\s*\n+", "\n\n", code)
    return code.strip() + "\n"


def read(rel):
    with open(os.path.join(ROOT, rel)) as f:
        return f.read()


def gw_imports(code):
    return re.findall(r"^import Definitions\.Def_GrossWilsonK3_(\w+)", code, flags=re.M)


def dep_closure(names):
    seen, stack = [], list(names)
    while stack:
        n = stack.pop()
        if n in seen:
            continue
        seen.append(n)
        stack.extend(gw_imports(read(f"Definitions/Def_GrossWilsonK3_{n}.lean")))
    return [d for d in DEFS if d in seen]


def audit_bundle(main_title, main_code, deps):
    parts = [f"### {main_title}\n\n```lean\n{strip_comments(main_code)}```\n"]
    for d in deps:
        parts.append(
            f"### Imported definition file `Definitions.Def_GrossWilsonK3_{d}`\n\n"
            f"```lean\n{strip_comments(read(f'Definitions/Def_GrossWilsonK3_{d}.lean'))}```\n"
        )
    return "\n".join(parts)


for d in DEFS:
    code = read(f"Definitions/Def_GrossWilsonK3_{d}.lean")
    deps = [x for x in dep_closure(gw_imports(code)) if x != d]
    item = {
        "kind": "definition",
        "name": f"GrossWilsonK3_{d}",
        "code": code,
        "audit_text": audit_bundle(f"Definition file `Definitions.Def_GrossWilsonK3_{d}` (the item to read back)", code, deps),
    }
    with open(os.path.join(OUT, f"def_{d}.json"), "w") as f:
        json.dump(item, f, indent=1, ensure_ascii=False)

for t in THMS:
    code = read(f"Theorems/Thm_GrossWilsonK3_{t}.lean")
    pre, rest = code.split("namespace GrossWilsonK3", 1)
    body = strip_comments("namespace GrossWilsonK3" + rest)
    deps = dep_closure(gw_imports(code))
    item = {
        "kind": "theorem",
        "name": f"GrossWilsonK3.{t}",
        "preamble": pre.strip(),
        "formal_statement": body.strip(),
        "audit_text": audit_bundle(
            "Theorem (the item to read back)", pre.strip() + "\n\n" + body, deps
        ),
    }
    with open(os.path.join(OUT, f"thm_{t}.json"), "w") as f:
        json.dump(item, f, indent=1, ensure_ascii=False)

print(sorted(os.listdir(OUT)))
