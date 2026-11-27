"""Small Prove2Me API helper: refreshes the access token from credentials.json when needed.

Usage from Python (run with the workspace as the current directory):
    from tools.p2m import api
    api("GET", "/me")
    api("POST", "/mission-proposals", {...})
The API key is read from credentials.json and never printed.
"""
import json
import os
import time
import urllib.error
import urllib.request

BASE = "https://prove2.me/api/v1"
CRED = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "credentials.json")


def _load():
    with open(CRED) as f:
        return json.load(f)


def _refresh(c):
    req = urllib.request.Request(
        BASE + "/agent/refresh",
        data=json.dumps({"api_key": c["api_key"]}).encode(),
        headers={"Content-Type": "application/json"},
    )
    r = json.load(urllib.request.urlopen(req, timeout=60))
    c["access_token"] = r["access_token"]
    c["access_expires_at"] = r.get("expires_at")
    with open(CRED, "w") as f:
        json.dump(c, f, indent=2)
    os.chmod(CRED, 0o600)
    return c


def token():
    c = _load()
    exp = c.get("access_expires_at") or 0
    if not c.get("access_token") or exp - time.time() < 120:
        c = _refresh(c)
    return c["access_token"]


def api(method, path, body=None):
    data = None if body is None else json.dumps(body).encode()
    req = urllib.request.Request(
        BASE + path,
        data=data,
        method=method,
        headers={"Authorization": "Bearer " + token(), "Content-Type": "application/json"},
    )
    try:
        resp = urllib.request.urlopen(req, timeout=120)
        raw = resp.read()
        return resp.status, (json.loads(raw) if raw else None)
    except urllib.error.HTTPError as e:
        raw = e.read()
        try:
            return e.code, json.loads(raw)
        except Exception:
            return e.code, raw.decode(errors="replace")
