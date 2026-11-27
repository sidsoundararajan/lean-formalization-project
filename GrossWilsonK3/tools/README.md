# Prove2Me tooling for the Gross–Wilson mission

These scripts build and upload the draft mission proposal. They are meant to run from the root of a
Prove2Me workspace (a clone of `prove2me/prove2me_workspace`) that holds the Lean files in
`Definitions/` and `Theorems/` and a `credentials.json` with your API key. The key file is never
committed.

| File | Purpose |
|------|---------|
| `p2m.py` | Minimal Prove2Me API client; refreshes the access token from `credentials.json` |
| `build_items.py` | Builds one payload per proposal item, plus a comment-free audit bundle |
| `audit/` | The packets given to the blind auditors (role instructions plus Lean code only) |
| `readbacks/` | The auditors' read-backs, attached to each item |
| `proposal_content.py` | Mission description, item titles, sources, plain-language statements and milestone text |
| `upload_proposal.py` | Creates or updates the proposal, its items, goal, order and milestones |
| `proposal_state.json` | Ids of the draft proposal and its items, so reruns update in place |
| `items/` | Generated payloads |

To update the draft after editing Lean files or text:

```bash
python3 tools/build_items.py && python3 tools/upload_proposal.py
```
