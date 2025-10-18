#!/usr/bin/env sh
set -eu

# Verify manifest hashes with Python's stdlib (SHA-256, SHA3-256)
PY=${PYTHON:-python3}

$PY - << 'PYCODE'
import json, hashlib, sys, os

def sha256(p):
    h=hashlib.sha256()
    with open(p,'rb') as f:
        for chunk in iter(lambda:f.read(1<<20), b''):
            h.update(chunk)
    return h.hexdigest()

def sha3(p):
    h=hashlib.sha3_256()
    with open(p,'rb') as f:
        for chunk in iter(lambda:f.read(1<<20), b''):
            h.update(chunk)
    return h.hexdigest()

with open('manifest/manifest.json','r', encoding='utf-8') as f:
    mani=json.load(f)

errors=0
for entry in mani['files']:
    p=entry['path']
    if not os.path.exists(p):
        print(f"[missing] {p}")
        errors+=1
        continue
    s256=sha256(p)
    s3=sha3(p)
    ok = (s256==entry['sha256']) and (s3==entry['sha3_256'])
    print(f"[check] {p}: {'OK' if ok else 'FAIL'}")
    if not ok:
        print(f"       expected sha256={entry['sha256']} got {s256}")
        print(f"       expected sha3_256={entry['sha3_256']} got {s3}")
        errors+=1

print(f"[summary] {len(mani['files'])} files checked, {errors} errors")
sys.exit(1 if errors else 0)
PYCODE
