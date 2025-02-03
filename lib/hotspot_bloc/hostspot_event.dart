part of 'hotspot_bloc.dart';

@freezed
class HotspotEvent with _$HotspotEvent {
  const factory HotspotEvent.init() = _HotspotEventInit;

  const factory HotspotEvent.initHotspot() = _HotspotEventInitHotspot;

  const factory HotspotEvent.closeHotspot() = _HotspotEventCloseHotspot;

  const factory HotspotEvent.checkPermissions() = _HotspotEventCheckPermissions;

  const factory HotspotEvent.askLocationPermission() = _HotspotEventAskLocationPermission;

  const factory HotspotEvent.askNearbyWiFiDevicesPermission() = _HotspotEventAskNearbyWiFiDevicesPermission;

  const factory HotspotEvent.askWriteSettingsPermission() = _HotspotEventAskWriteSettingsPermission;
}
