# Android permission plan

Do not request every permission at installation. Add each permission with the feature that needs it, explain it in context and test across supported Android API levels.

| Permission / API | Intended use | Timing |
|---|---|---|
| `INTERNET` | Local sockets and WebRTC networking APIs; does not itself require internet connectivity | Add with networking implementation |
| `ACCESS_NETWORK_STATE` | Observe network availability/changes | LAN discovery |
| `ACCESS_WIFI_STATE` | Read Wi-Fi state | LAN discovery |
| `CHANGE_WIFI_STATE` | Wi-Fi operations where applicable | Only if required by selected API |
| `CHANGE_WIFI_MULTICAST_STATE` | Receive multicast traffic on devices/networks requiring it for mDNS | NSD implementation; verify on devices |
| `NEARBY_WIFI_DEVICES` | Nearby Wi-Fi operations on Android 13+ where applicable | Wi-Fi Direct/nearby Wi-Fi feature |
| `ACCESS_FINE_LOCATION` | Legacy location permission for relevant Wi-Fi discovery APIs on older Android versions | Only where required, especially API 32 and below |
| Bluetooth runtime permissions | `BLUETOOTH_SCAN`, `BLUETOOTH_CONNECT`, and possibly `BLUETOOTH_ADVERTISE` on Android 12+ | Only if Bluetooth spike justifies implementation |
| `RECORD_AUDIO` | Microphone capture | Request immediately before/when user accepts a call |
| `MODIFY_AUDIO_SETTINGS` | Manage audio routing/mode | Voice implementation |
| `POST_NOTIFICATIONS` | Call notifications on Android 13+ | Incoming-call feature |
| Foreground service permissions/types | Ongoing call and microphone service as required by target SDK | Active-call feature; follow current Android requirements |

`CHANGE_WIFI_MULTICAST_STATE` is commonly overlooked. Validate NSD/mDNS receive behaviour on physical devices; use a multicast lock only while discovery requires it and release it promptly.

Permission requirements change across Android versions and target SDKs. Confirm against current Android documentation before release. Never claim that the `INTERNET` permission means the application needs an internet connection.
