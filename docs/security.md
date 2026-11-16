# Security baseline

This is a design baseline, not a completed security assessment.

- Generate device identity keys and protect private keys with Android Keystore.
- Pair through QR exchange plus an explicit verification step.
- Never treat discovery broadcasts as identity proof.
- Authenticate peers before accepting signalling.
- Use WebRTC DTLS-SRTP for media; do not invent custom audio encryption.
- Make signalling versioned and replay-resistant; validate lengths, fields and message state.
- Do not log keys, ICE credentials, SDP or sensitive call content in production.
- Do not record calls by default.
- Capture/transmit microphone audio only after call acceptance.
- Keep permissions minimal and request them in context.
- Review dependency provenance, update cadence and known vulnerabilities before release.
- Use Dependabot for Gradle and GitHub Actions update proposals; review and test updates before merging.
