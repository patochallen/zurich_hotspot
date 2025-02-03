import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zurich/extensions/context_extension.dart';
import 'package:zurich/hotspot_bloc/hotspot_bloc.dart';
import 'package:zurich/hp_screen.dart';
import 'package:zurich/server_bloc/server_bloc.dart';
import 'package:zurich/server_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  _getChildren(bool showButton, String? url, Orientation orientation) {
    return [
      HpScreen(showButton: showButton),
      if (url != null) ...[
        orientation == Orientation.landscape ? const VerticalDivider(thickness: 5) : const Divider(thickness: 5),
        const ServerScreen(),
      ]
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotspotBloc, HotspotState>(
        bloc: context.hotspotBloc,
        builder: (context, hotspotState) {
          print('SARASA $hotspotState');
          return BlocBuilder<ServerBloc, ServerState>(
              bloc: context.serverBloc,
              builder: (context, serverState) {
                if (hotspotState.ssid == null && serverState.isServerActive) {
                  context.serverBloc.add(const ServerEvent.closeServer());
                }
                print('SARASA $serverState');
                final showButton = (!serverState.isServerActive || hotspotState.ssid == null) &&
                    hotspotState.locationGranted &&
                    hotspotState.nearbyWiFiDevicesGranted &&
                    hotspotState.writeSettingsGranted &&
                    !hotspotState.deviceTetheringConnected &&
                    !hotspotState.deviceConnectedToWiFi;
                print('SARASA showButton: $showButton isServerActive: ${serverState.isServerActive}');
                return SafeArea(
                  child: OrientationBuilder(builder: (context, orientation) {
                    print('SARASA orientation: $orientation');
                    return orientation == Orientation.portrait
                        ? Column(children: _getChildren(showButton, hotspotState.url, orientation))
                        : Row(children: _getChildren(showButton, hotspotState.url, orientation));
                  }),
                );
              });
        });
  }
}
