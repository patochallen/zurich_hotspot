import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_ap/network_ap.dart';

// import 'package:network_ap_example/main.dart';
// import 'package:network_info_plus/network_info_plus.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';
// import 'package:wifi_iot/wifi_iot.dart';
import 'package:zurich/common/qr_view.dart';
import 'package:zurich/server_bloc/server_bloc.dart';
import 'package:zurich/extensions/context_extension.dart';
// import 'package:zurich/wifi_iot.dart';

class ServerScreen extends StatelessWidget {
  const ServerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServerBloc, ServerState>(
      bloc: context.serverBloc,
      builder: (context, state) {
        return Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Text(
                state.isServerActive ? 'Server is running' : 'Server is stopped',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (state.isServerActive) {
                    context.serverBloc.add(const ServerEvent.closeServer());
                  } else {
                    context.serverBloc.add(const ServerEvent.initServer());
                  }
                },
                child: Text(state.isServerActive ? 'Stop Server' : 'Start Server'),
              ),
              const SizedBox(height: 20),
              if (state.url != null) Expanded(child: QrView(title: 'Connect to Server', data: state.url!)),
              const SizedBox(height: 20),
              if (state.url != null)
                GestureDetector(
                  onTap: () => _launchUrl(state.url!),
                  child: Text(state.url!, style: const TextStyle(fontSize: 20)),
                ),
            ],
          ),
        );
      },
    );
  }
}

void _launchUrl(String url) async {
  print('SARASA _launchUrl');
  try {
    await launchUrlString(url, mode: LaunchMode.externalApplication);
  } catch (e) {
    print('SARASA ERROR: $e');
  }
}

// Future<String?> getWiFiAPSSID() async {
//   try {
//     // final getWiFiAPSSID = await WiFiForIoTPlugin.getWiFiAPSSID();
//     // print('SARASA getWiFiAPSSID: $getWiFiAPSSID');
//     final getWifiName = await NetworkInfo().getWifiName();
//     print('SARASA getWifiName: $getWifiName');
//     final getWifiBSSID = await NetworkInfo().getWifiBSSID();
//     print('SARASA getWifiBSSID: $getWifiBSSID');
//     final getBSSID = await WiFiForIoTPlugin.getBSSID();
//     print('SARASA getBSSID: $getBSSID');
//     final getFrequency = await WiFiForIoTPlugin.getFrequency();
//     print('SARASA getFrequency: $getFrequency');
//     final getIP = await WiFiForIoTPlugin.getIP();
//     print('SARASA getIP: $getIP');
//     final getSSID = await WiFiForIoTPlugin.getSSID();
//     print('SARASA getSSID: $getSSID');
//     // final getWiFiAPPreSharedKey = await WiFiForIoTPlugin.getWiFiAPPreSharedKey();
//     // print('SARASA getWiFiAPPreSharedKey: $getWiFiAPPreSharedKey');
//     final getCurrentSignalStrength = await WiFiForIoTPlugin.getCurrentSignalStrength();
//     print('SARASA getCurrentSignalStrength: $getCurrentSignalStrength');
//     // final getWiFiAPState = await WiFiForIoTPlugin.getWiFiAPState();
//     // print('SARASA getWiFiAPState: $getWiFiAPState');
//     return await WiFiForIoTPlugin.getWiFiAPSSID();
//   } on PlatformException catch (e) {
//     print('SARASA EXCEPTION: ${e}');
//     return 'ERROR';
//   }
// }

/// Returns the WiFi AP State
///
/// ```
/// 0 = WIFI_AP_STATE_DISABLING
/// 1 = WIFI_AP_STATE_DISABLED
/// 2 = WIFI_AP_STATE_ENABLING
/// 3 = WIFI_AP_STATE_ENABLED
/// 4 = WIFI_AP_STATE_FAILED
/// ```
// Future<int?> getWiFiAPState() async {
//   try {
//     return await WiFiForIoTPlugin.getWiFiAPState();
//   } on PlatformException catch(e) {
//     print('SARASA EXCEPTION: ${e.stacktrace}');
//     return 5;
//   }
// }
