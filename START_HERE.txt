# Start Here (Quick-Start Manual)

This kit demonstrates patterns for durable software:

- Plain text specs and tests
- Deterministic builds
- Verifiable manifests (SHA-256 and SHA3-256)
- Simple, portable reference code in C99 and WebAssembly (text format)

## Verify integrity
```sh
./scripts/verify.sh
```

## Build and run
```sh
./scripts/build.sh
./bin/longrun --selftest
```

## What this program does (tiny demo)
The C99 binary prints its version and runs text-based self-tests from `tests/test_vectors.txt`.
This is intentionally small so the structure—not complexity—is the focus.

## Where to look next
- `docs/SPEC.md` — data formats, interfaces, invariants
- `docs/RUNBOOK.md` — install, backup, restore, maintenance
- `docs/CRYPTO_MIGRATION.md` — how to rotate and migrate algorithms
- `docs/GOVERNANCE.md` — roles, key custody, succession
