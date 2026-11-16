# ECHO — Offline Local Communication

ECHO is an Android project exploring secure, direct communication between nearby devices when cellular service and internet access are unavailable.

**Initial product scope:** offline/local calling. ECHO Phase 1 does not guarantee emergency message or call delivery.

## Phase 1 target
A working two-phone demonstration over the same local Wi-Fi network, with mobile data and internet access disabled:
1. Device identity and QR pairing
2. Local-network discovery
3. Secure full-duplex voice calling using WebRTC and Opus
4. Incoming-call notifications and supported standby behaviour

Wi-Fi Direct is the next transport milestone. Bluetooth is being assessed in an early feasibility spike, but is not yet a committed voice transport.

## Current status
Phase 1.1 starter foundation. The UI is a shell; pairing, discovery, voice, Bluetooth transport and background incoming calls are not implemented.

## Build
The GitHub Actions workflow runs Android lint, unit tests and a debug APK build. Download the `ECHO-debug-apk` artifact from the workflow run.

The Gradle wrapper configuration and scripts are included. The wrapper JAR is intentionally not fabricated in this package. Generate the official wrapper JAR using the instructions in `docs/building.md` before relying on `./gradlew` locally or switching CI fully to wrapper execution.

## Design principles
- Local-first; no cloud service is required for local communication.
- No public STUN/TURN dependency in offline mode.
- Explicit pairing and authenticated peers.
- WebRTC DTLS-SRTP for media protection.
- Microphone capture and transmission only after the user accepts.
- Respect Android background, permission and battery restrictions.
- Never represent best-effort local communication as guaranteed emergency delivery.

## Documentation
- [Architecture](docs/architecture.md)
- [Phase 1.1 plan](docs/phase-1-plan.md)
- [Build instructions](docs/building.md)
- [Permissions](docs/permissions.md)
- [Bluetooth feasibility](docs/bluetooth-feasibility.md)
- [Security](docs/security.md)
- [Testing](docs/testing.md)

## Licence
Licensed under Apache License 2.0. See [LICENSE](LICENSE).
