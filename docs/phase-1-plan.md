# ECHO Phase 1.1 plan

## Foundation and quality gates
- [x] Kotlin/Compose app shell
- [x] CI workflow for lint, unit tests and debug APK
- [x] JUnit unit-test infrastructure and starter test
- [x] Dependabot for Gradle and GitHub Actions
- [x] Apache-2.0 licence
- [ ] Generate and commit the official Gradle wrapper JAR
- [ ] First clean CI run

## Early parallel feasibility work
- [ ] LAN NSD/mDNS proof of concept on at least three Android models
- [ ] Verify multicast receive behaviour and permission/lock requirements
- [ ] Bluetooth feasibility spike: BLE discovery/control; assess Classic audio and LE Audio support separately
- [ ] Record compatibility, latency, power and API limitations; do not commit to Bluetooth voice until proven

## Core milestones
1. Device identity and QR pairing with explicit trust confirmation.
2. LAN discovery and authenticated peer connection.
3. WebRTC/Opus local voice with host ICE candidates and no public STUN/TURN dependency.
4. Incoming-call notifications and supported standby behaviour.
5. Two-device offline LAN demonstration.

## Call setup design
While ringing, pre-warm the peer connection and signalling path and gather/check host ICE candidates where possible. Do not capture or transmit microphone audio until the user accepts. Complete or renegotiate send/receive media after acceptance if required.

## Acceptance test
Two paired phones on the same local Wi-Fi network; mobile data disabled; internet unavailable; receiver screen locked; incoming call notification displayed under supported OS conditions; user accepts; full-duplex audio works; either side can hang up.

## Later work
Wi-Fi Direct, local-only hotspot, store-and-forward emergency messages, multi-hop relay research and any Bluetooth voice mode proven feasible.
