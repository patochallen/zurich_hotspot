import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:network_ap/network_ap.dart';

part 'hospot_state.dart';

part 'hostspot_event.dart';

part 'hotspot_bloc.freezed.dart';

class HotspotBloc extends Bloc<HotspotEvent, HotspotState> {
  HotspotBloc() : super(const HotspotState()) {
    on<_HotspotEventInit>(_onHotspotEventInit);
    on<_HotspotEventInitHotspot>(_onHotspotEventInitHotspot);
    on<_HotspotEventCloseHotspot>(_onHotspotEventCloseHotspot);
    on<_HotspotEventCheckPermissions>(_onHotspotEventCheckPermissions);
    on<_HotspotEventAskLocationPermission>(_onHotspotEventAskLocationPermission);
    on<_HotspotEventAskNearbyWiFiDevicesPermission>(_onHotspotEventAskNearbyWiFiDevicesPermission);
    on<_HotspotEventAskWriteSettingsPermission>(_onHotspotEventAskWriteSettingsPermission);
  }

  final networkAp = NetworkAp();
  StreamSubscription? subscription;

  void _onHotspotEventInit(
    _HotspotEventInit event,
    Emitter<HotspotState> emit,
  ) async {
    final APManagerResult? result = await networkAp.getActiveHotspot();
    emit(state.copyWith(
      ssid: result?.ssid,
      password: result?.password,
      url: result?.url,
      data: result?.ssid == null ? null : 'WIFI:S:${result!.ssid};T:WPA;P:${result!.password};H:false;;',
      error: null,
    ));
    add(const HotspotEvent.checkPermissions());
    subscription?.cancel();
    subscription = networkAp.readyToStart().distinct().listen((event) {
      print('SARASA STREAM: $event');
      if (!event && state.ssid != null) {
        print('SARASA STREAM close hotspot: $event');
        add(const HotspotEvent.closeHotspot());
      } else {
        add(const HotspotEvent.checkPermissions());
      }
    });
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
  void _onHotspotEventInitHotspot(
    _HotspotEventInitHotspot event,
    Emitter<HotspotState> emit,
  ) async {
    try {
      final APManagerResult? result = await networkAp.enableHotspot();
      if (result == null) {
        emit(state.copyWith(ssid: null, password: null, data: null));
        return;
      }
      emit(state.copyWith(
        ssid: result.ssid,
        url: result.url,
        password: result.password,
        data: 'WIFI:S:${result.ssid};T:WPA;P:${result.password};H:false;;',
        error: null,
      ));
    } on APManagerException catch (e) {
      emit(state.copyWith(ssid: null, password: null, data: null, url: null, error: e.errorCode));
      print('SARASA Error networkAp.enableHotspot $e');
      rethrow;
    }
  }

  void _onHotspotEventCloseHotspot(
    _HotspotEventCloseHotspot event,
    Emitter<HotspotState> emit,
  ) async {
    try {
      print('SARASA disableHotspot');
      networkAp.disableHotspot();
    } on APManagerException catch (e) {
      print('SARASA Error networkAp.disableHotspot $e');
    }
    emit(state.copyWith(ssid: null, password: null, data: null, url: null));
    add(const HotspotEvent.checkPermissions());
  }

  void _onHotspotEventCheckPermissions(
    _HotspotEventCheckPermissions event,
    Emitter<HotspotState> emit,
  ) async {
    final locationGranted = await networkAp.isLocationPermissionGranted();
    final nearbyDevicesGranted = await networkAp.isNearbyWifiDevicesPermissionGranted();
    final writeSettingsGranted = await networkAp.isWriteSettingsGranted();
    final deviceConnectedToWiFi = await networkAp.isDeviceConnectedToWifi();
    final deviceTetheringConnected = await networkAp.isDeviceTetheringConnected();
    emit(state.copyWith(
      locationGranted: locationGranted,
      nearbyWiFiDevicesGranted: nearbyDevicesGranted,
      writeSettingsGranted: writeSettingsGranted,
      deviceConnectedToWiFi: deviceConnectedToWiFi,
      deviceTetheringConnected: deviceTetheringConnected,
    ));
  }

  void _onHotspotEventAskLocationPermission(
    _HotspotEventAskLocationPermission event,
    Emitter<HotspotState> emit,
  ) async {
    await networkAp.requestLocationPermission();
    add(const HotspotEvent.checkPermissions());
  }

  void _onHotspotEventAskNearbyWiFiDevicesPermission(
    _HotspotEventAskNearbyWiFiDevicesPermission event,
    Emitter<HotspotState> emit,
  ) async {
    await networkAp.requestNearbyDevicesPermission();
    add(const HotspotEvent.checkPermissions());
  }

  void _onHotspotEventAskWriteSettingsPermission(
    _HotspotEventAskWriteSettingsPermission event,
    Emitter<HotspotState> emit,
  ) async {
    await networkAp.askWriteSettingPermission();
    add(const HotspotEvent.checkPermissions());
  }
}
