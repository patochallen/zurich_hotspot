import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_ap/network_ap.dart';
import 'package:zurich/extensions/context_extension.dart';
import 'package:zurich/hotspot_bloc/hotspot_bloc.dart';
import 'package:zurich/network_status/requirement_item.dart';

class Requirements extends StatefulWidget {
  const Requirements({super.key});

  @override
  State<Requirements> createState() => _RequirementsState();
}

class _RequirementsState extends State<Requirements> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && mounted) {
      context.hotspotBloc.add(const HotspotEvent.checkPermissions());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotspotBloc, HotspotState>(builder: (context, state) {
      return Column(
        children: [
          const Text('Requirements', style: TextStyle(fontSize: 25)),
          const SizedBox(height: 10),
          const Divider(),
          RequirementItem(
            name: 'Location Permission',
            status: state.locationGranted,
            callback: () => context.hotspotBloc.add(const HotspotEvent.askLocationPermission()),
          ),
          const Divider(),
          RequirementItem(
            name: 'Nearby Wifi Devices Permission',
            status: state.nearbyWiFiDevicesGranted,
            callback: () => context.hotspotBloc.add(const HotspotEvent.askNearbyWiFiDevicesPermission()),
          ),
          const Divider(),
          RequirementItem(
            name: 'Write Settings Permission',
            status: state.writeSettingsGranted,
            callback: () => NetworkAp().openWriteSystemSettings(),
          ),
          const Divider(),
          RequirementItem(
            name: 'Device WiFi Connection',
            status: !state.deviceConnectedToWiFi,
            callback: () => NetworkAp().openWiFiSettings(),
          ),
          const Divider(),
          RequirementItem(
            name: 'Device Tethering Status',
            status: !state.deviceTetheringConnected,
            callback: () => NetworkAp().openTetheringSettings(),
          ),
          const Divider(),
          const SizedBox(height: 10),
          // GestureDetector(
          //   onTap: () => context.hotspotBloc.add(const HotspotEvent.checkPermissions()),
          //   child: const Text('refresh', style: TextStyle(fontSize: 20, decoration: TextDecoration.underline)),
          // )
        ],
      );
    });
  }
}
