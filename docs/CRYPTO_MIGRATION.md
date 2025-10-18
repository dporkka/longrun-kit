# CRYPTO_MIGRATION

We publish two hashes per file today: SHA-256 and SHA3-256.

## Migration Plan
- Additive acceptance: future manifests may include additional hash types
- A manifest is valid if N-of-M hash verifications succeed (default: 2-of-2 today)
- Keep old hashes for backward verification; never remove without a major version increment

## Post-Quantum
- This kit does not ship signatures. In production, sign `manifest.json` with Ed25519 (today),
  and document the path to PQ signatures (Dilithium or Falcon) when available.
