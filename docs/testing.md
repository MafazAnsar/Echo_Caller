# Test strategy

## Continuous integration
Every push and pull request to `main` should run:
- Android lint
- JVM unit tests
- Debug APK build

A passing build is necessary but not sufficient for release. Add instrumentation tests when pairing, network discovery and call flows exist.

## Current starter test
`ExampleUnitTest` is deliberately a minimal sanity check proving that the test source set and JUnit runner are wired. Replace it with meaningful tests as domain logic is introduced.

## Device tests
- Install on physical devices (API 29+).
- Test at least three manufacturers before relying on background behaviour.
- Verify runtime permission denial and recovery paths.

## Network tests (when implemented)
- Two devices on same Wi-Fi LAN.
- Mobile data disabled.
- Internet unavailable.
- NSD discovery with multicast reception tested.
- Repeat across access points and locked-screen conditions.
- Confirm no public STUN/TURN dependency in offline mode.

## Voice tests (when implemented)
- Full-duplex call, mute, speaker/earpiece routing and hang-up.
- 30-minute continuous call.
- Repeated connect/disconnect and Wi-Fi transition tests.
- Measure call setup, one-way latency and packet loss.

## Reliability
- Standby battery tests over 8 and 24 hours.
- Record OS version, manufacturer, network and permission state for every result.
