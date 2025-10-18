# SPEC (Durable Software Spec)

## Scope
A reference layout for long-lived systems. This repository specifies:
- File/dir structure
- Integrity manifests
- Build & verification processes
- A tiny reference program and conformance tests

## Formats
- Text encoding: UTF-8
- Timestamps: ISO-8601 UTC (e.g., 2038-01-19T03:14:07Z) — leap-second policy: smeared, documented here
- Hashes: SHA-256 and SHA3-256 (crypto-agility defined in CRYPTO_MIGRATION.md)
- Archives: `.tar.zst` suggested for releases (not included here)

## Interfaces
- CLI: `longrun [--version|--selftest]`
- Exit codes: 0 success, non-zero error

## Test Vectors
Located at `tests/test_vectors.txt`. Each line: `input -> expected_output`.
