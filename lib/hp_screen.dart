import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zurich/common/qr_view.dart';
import 'package:zurich/extensions/context_extension.dart';
import 'package:zurich/hotspot_bloc/hotspot_bloc.dart';
import 'package:zurich/network_status/requirements.dart';
import 'package:zurich/server_bloc/server_bloc.dart';

class HpScreen extends StatelessWidget {
  final bool showButton;

  const HpScreen({super.key, required this.showButton});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotspotBloc, HotspotState>(
      bloc: context.hotspotBloc,
      // listenWhen: (previous, current) => current.error != null && previous.error != current.error,
      // listener: (context, state) {
      //   switch (state.error!) {
      //     case APManagerError.errorDisableHotspot:
      //       openTetheringSettings();
      //       print('SARASA HP SCREEN errorDisableHotspot');
      //     case APManagerError.errorUnknown:
      //       print('SARASA HP SCREEN errorUnknown');
      //     case APManagerError.errorLocationPermissionDenied:
      //       requestLocationPermission();
      //       print('SARASA HP SCREEN errorLocationPermissionDenied');
      //     case APManagerError.errorWifiActive:
      //       openWiFiSettings();
      //       print('SARASA HP SCREEN errorWifiActive');
      //     case APManagerError.errorWriteSettingsPermissionRequired:
      //       openWriteSystemSettings();
      //       print('SARASA HP SCREEN errorWriteSettingsPermissionRequired');
      //     case APManagerError.errorNearbyWifiDevicesPermissionDenied:
      //       requestNearbyDevicesPermission();
      //       print('SARASA HP SCREEN errorNearbyWifiDevicesPermissionDenied');
      //     case APManagerError.errorHotspotActive:
      //       print('SARASA HP SCREEN errorHotspotActive');
      //   }
      // },
      builder: (context, state) {
        return Expanded(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                state.ssid != null ? 'Hotspot is active' : 'Hotspot is stopped',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              // if (showButton)
              ElevatedButton(
                onPressed: showButton
                    ? () {
                        if (state.ssid != null) {
                          context.serverBloc.add(const ServerEvent.closeServer());
                          context.hotspotBloc.add(const HotspotEvent.closeHotspot());
                        } else {
                          context.hotspotBloc.add(const HotspotEvent.initHotspot());
                        }
                      }
                    : null,
                child: Text(state.ssid != null ? 'Stop Hotspot' : 'Start Hotspot'),
              ),
              const SizedBox(height: 20),
              if (state.ssid != null) Expanded(child: QrView(title: 'Connect to Hotspot', data: state.data!)),
              const SizedBox(height: 20),
              if (state.url != null) Text(state.url!, style: const TextStyle(fontSize: 20)),
              if (state.url == null) ...[
                const SizedBox(height: 50),
                // const Spacer(),
                const Requirements(),
              ],
            ],
          ),
        );
      },
    );
  }
}
