# longrun-kit

A minimal, durable starter kit for ultra-long-lived software. Goals: simple, rebuildable, verifiable.

## Contents
- `docs/` human-first spec, runbook, governance, crypto agility notes
- `src/` tiny reference implementations (C99 and WASM)
- `scripts/` deterministic build, verify, and maintenance helpers
- `manifest/` machine-verifiable file manifest (hashes, sizes, schema)
- `LICENSES/` code and docs licenses

## Quick start
1. Read `START_HERE.md` or `START_HERE.txt` (same content).
2. Verify integrity: `./scripts/verify.sh`
3. Build the C reference: `./scripts/build.sh`
4. Run the self-test: `./bin/longrun --selftest`

Everything is text-first, single-binary, and pinned to boring, portable defaults.
