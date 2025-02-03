import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zurich/home_screen.dart';
import 'package:zurich/hotspot_bloc/hotspot_bloc.dart';

import 'server_bloc/server_bloc.dart';

class ServerBlocProvider extends StatefulWidget {
  const ServerBlocProvider({super.key});

  @override
  State<ServerBlocProvider> createState() => _ServerBlocProviderState();
}

class _ServerBlocProviderState extends State<ServerBlocProvider> {
  ServerBloc? _serverBloc;
  HotspotBloc? _hotspotBloc;

  @override
  void initState() {
    setState(() {
      _serverBloc = ServerBloc();
      _hotspotBloc = HotspotBloc()..add(const HotspotEvent.init());
    });
    super.initState();
  }

  @override
  void dispose() {
    _hotspotBloc?.add(const HotspotEvent.closeHotspot());
    _serverBloc?.add(const ServerEvent.closeServer());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _serverBloc != null && _hotspotBloc != null
        ? MultiBlocProvider(
            providers: [
              BlocProvider.value(value: _serverBloc!),
              BlocProvider.value(value: _hotspotBloc!),
            ],
            child: const HomeScreen(),
          )
        : const Center(child: CircularProgressIndicator());
  }
}
