#!/usr/bin/env python3
import os, json, hashlib, time

ROOT = os.path.dirname(os.path.dirname(__file__))

def sha256(path):
    h=hashlib.sha256()
    with open(path, 'rb') as f:
        for ch in iter(lambda:f.read(1<<20), b''):
            h.update(ch)
    return h.hexdigest()

def sha3(path):
    h=hashlib.sha3_256()
    with open(path, 'rb') as f:
        for ch in iter(lambda:f.read(1<<20), b''):
            h.update(ch)
    return h.hexdigest()

files = []
for dirpath, _, filenames in os.walk(ROOT):
    # Skip build artifacts
    if any(part in dirpath for part in (os.sep+'build', os.sep+'.git')):
        continue
    for fn in filenames:
        p = os.path.join(dirpath, fn)
        rel = os.path.relpath(p, ROOT)
        if rel.startswith('manifest/manifest.json'):
            continue
        st = os.stat(p)
        files.append({
            "path": rel.replace('\\','/'),
            "size": st.st_size,
            "sha256": sha256(p),
            "sha3_256": sha3(p),
        })

manifest = {
    "schema": "longrun.manifest/v1",
    "generated_utc": time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime()),
    "files": sorted(files, key=lambda e: e["path"]),
}

os.makedirs(os.path.join(ROOT, "manifest"), exist_ok=True)
with open(os.path.join(ROOT, "manifest/manifest.json"), "w", encoding="utf-8", newline="\n") as f:
    json.dump(manifest, f, indent=2, sort_keys=False)
print(f"Wrote manifest with {len(files)} files")
