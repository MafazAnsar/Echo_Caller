# ECHO architecture

## Product scope
The initial product is **offline/local communication**, not a guaranteed emergency communications service. The first acceptance target is two Android phones on the same local Wi-Fi network with mobile data and internet access disabled.

## Layers
- Presentation: Jetpack Compose screens for nearby devices, pairing, incoming call and active call.
- Domain: device/call models, use cases, repository contracts and call state machine.
- Data: Room for trusted devices and call history; DataStore for preferences.
- Discovery: Android NSD/mDNS on LAN first; Wi-Fi Direct next.
- Transport: transport abstraction for LAN, Wi-Fi Direct and any experimentally validated Bluetooth path.
- Voice: WebRTC with Opus.
- Security: Android Keystore identity, QR pairing, authenticated signalling and DTLS-SRTP media.

## Local network path
Advertise/discover `_echo._tcp.local` using Android NSD. Test multicast reception on physical devices and networks. Some devices require `CHANGE_WIFI_MULTICAST_STATE` and a carefully scoped multicast lock. Discovery results are hints, not proof of identity.

Offline mode must not depend on public STUN/TURN servers. Validate host-candidate connectivity on real devices and multiple access points.

## Bluetooth
Bluetooth is an early feasibility investigation, not a promised voice fallback. BLE discovery/control, Bluetooth Classic audio profiles and LE Audio are distinct paths with different Android APIs, profile support and device compatibility. See `bluetooth-feasibility.md`.

## Call preparation and state machine
Proposed states:

`IDLE → DISCOVERING → CONNECTING → RINGING_PREPARING_MEDIA → ACCEPTED_NEGOTIATING → ACTIVE → ENDED`

`RECONNECTING` may be entered from an active session after transient link loss.

During ringing, ECHO may create/warm the peer connection, establish authenticated signalling and gather/check host ICE candidates. It must not open the microphone or transmit audio before acceptance. Final send/receive media negotiation may still be required after acceptance; measure the actual post-answer setup time before choosing a more complex protocol.

## Background constraints
Use supported notifications and foreground-service types where required. Android and OEM battery policies can prevent reliable background discovery or incoming-call delivery. Force-stopped apps cannot be promised to receive calls. Request microphone access only in context and capture only after acceptance.
