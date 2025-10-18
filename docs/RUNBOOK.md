# RUNBOOK

This file is print-friendly and step-by-step for non-experts.

## Build (deterministic intent)
- Toolchain: any POSIX `cc` (clang/gcc) targeting C99
- Static linking with musl is preferred (optional), dynamic is acceptable

### Steps
```sh
./scripts/build.sh
```

## Verify
```sh
./scripts/verify.sh
```

## Backup/Restore (conceptual)
- Snapshot the entire directory tree
- Store copies in 3+ physical/geographic locations
- Keep printed `manifest/manifest.json` checksums with each copy

## Maintenance
Run:
```sh
./scripts/maintenance.sh --dry-run
./scripts/maintenance.sh
```
