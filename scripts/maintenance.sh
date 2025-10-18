#!/usr/bin/env sh
set -eu

DRY=0
if [ "${1:-}" = "--dry-run" ]; then DRY=1; fi

echo "[maintenance] computing current hashes and sizes..."
${PYTHON:-python3} scripts/regenerate_manifest.py
echo "[maintenance] manifest updated at manifest/manifest.json"

if [ "$DRY" -eq 1 ]; then
  echo "[maintenance] dry-run: no further action"
  exit 0
fi

echo "[maintenance] verifying manifest..."
./scripts/verify.sh
echo "[maintenance] done"
