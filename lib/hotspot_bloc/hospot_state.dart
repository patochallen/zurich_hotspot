part of 'hotspot_bloc.dart';

@freezed
class HotspotState with _$HotspotState {
  const factory HotspotState({
    @Default(null) String? ssid,
    @Default(null) String? password,
    @Default(null) String? data,
    @Default(null) String? url,
    @Default(false) bool locationGranted,
    @Default(false) bool nearbyWiFiDevicesGranted,
    @Default(false) bool writeSettingsGranted,
    @Default(false) bool deviceConnectedToWiFi,
    @Default(false) bool deviceTetheringConnected,
    @Default(null) APManagerError? error,
  }) = _HotspotState;
}
