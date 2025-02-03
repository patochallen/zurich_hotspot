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
      // const SizedBox(height: 20),
      if (url != null) ...[
        orientation == Orientation.landscape ? const VerticalDivider(thickness: 5) : const Divider(thickness: 5),
        const ServerScreen(),
        // const SizedBox(height: 20),
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

          // builder: (context, state) {
          //   // final networkAp = NetworkAp();
          //   final url = state.url;
          //   return Expanded(
          //     child: Column(
          //       mainAxisSize: MainAxisSize.min,
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         // const SizedBox(height: 50),
          //         // ElevatedButton(
          //         //   onPressed: () =>
          //         //       Navigator.push(context, MaterialPageRoute(builder: (context) => const NetworkApp())),
          //         //   child: const Text('open network'),
          //         // ),
          //         // const SizedBox(height: 20),
          //         // Text(state.isServerActive ? 'Server is running' : 'Server is stopped'),
          //         // const SizedBox(height: 20),
          //         ElevatedButton(
          //           onPressed: () async {
          //             if (state.isServerActive) {
          //               // networkAp.disableHotspot();
          //               context.serverBloc.add(const ServerEvent.closeServer());
          //             } else {
          //               // final APManagerResult? result = await networkAp.enableHotspot();
          //               context.serverBloc.add(const ServerEvent.initServer());
          //             }
          //           },
          //           child: Text(state.isServerActive ? 'Stop Server' : 'Start Server'),
          //         ),
          //         const SizedBox(height: 20),
          //         if (url != null)
          //           ElevatedButton(
          //             onPressed: () => _launchUrl(url),
          //             child: Text(url),
          //           ),
          //         const SizedBox(height: 20),
          //         if (state.url != null) QrImageView(data: state.url!, size: 150),
          //
          //         // Text("WiFi AP State"),
          //         // FutureBuilder(
          //         //     future: getWiFiAPSSID(),
          //         //     initialData: '',
          //         //     builder: (context, snapshot) {
          //         //       return Text(snapshot.data.toString());
          //         //     }),
          //         // FlutterWifiIoT(),
          //       ],
          //     ),
          //   );
          // },
        });
  }
}

// void _launchUrl(String url) async {
//   print('SARASA _launchUrl');
//   try {
//     await launchUrlString(url, mode: LaunchMode.externalApplication);
//   } catch (e) {
//     print('SARASA ERROR: $e');
//   }
// }
