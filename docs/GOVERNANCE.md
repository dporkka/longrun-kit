# GOVERNANCE

## Roles
- Maintainers: update code/docs without breaking compatibility
- Stewards: manage keys, mirrors, and releases
- Auditors: run conformance tests and publish results

## Succession
- Use N-of-M secret sharing (Shamir) for keys; printed shares stored in different jurisdictions
- When maintainers change, update the `manifest/CANONICAL.txt` hash and print new checksum sheets
