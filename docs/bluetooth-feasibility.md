# Bluetooth feasibility spike

## Objective
Determine whether Bluetooth adds a useful offline discovery/control path or a viable voice path. This is an investigation, not a delivery commitment.

## Evaluate separately
1. **BLE discovery and control:** Can two supported Android devices discover each other, exchange a small authenticated pairing/session message and recover from interruptions?
2. **Bluetooth Classic audio:** Determine whether Android exposes a suitable supported profile/API for app-to-app full-duplex voice. Do not assume an ordinary phone app can create an arbitrary HFP headset link between two phones.
3. **Bluetooth LE Audio:** Check OS version, chipset, profile and device support. LE Audio availability does not automatically provide a general-purpose app-to-app voice transport.

## Test matrix
- At least three Android models from different manufacturers.
- Supported Android versions and permission behaviour.
- Discovery time, connection time, audio latency if applicable, dropouts and battery impact.
- Simultaneous Wi-Fi/Bluetooth operation and coexistence.
- Behaviour with screen locked and app backgrounded.

## Decision gate
Retain BLE for discovery/control only if it is reliable and useful. Add Bluetooth voice only if a supported, interoperable full-duplex design is demonstrated on target devices with acceptable latency and power use. Otherwise document Bluetooth as unsupported and keep Wi-Fi as the voice transport.
