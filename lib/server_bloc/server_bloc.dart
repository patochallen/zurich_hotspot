import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart' hide Router;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:network_ap/network_ap.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_static/shelf_static.dart';

part 'server_bloc.freezed.dart';

part 'server_event.dart';

part 'server_state.dart';

class ServerBloc extends Bloc<ServerEvent, ServerState> {
  ServerBloc() : super(const ServerState()) {
    on<_ServerEventInitServer>(_onServerEventInitServer);
    on<_ServerEventCloseServer>(_onServerEventCloseServer);
  }

  static const staticPort = 5000;
  static const browserPath = 'browser';
  final networkAp = NetworkAp();

  void _onServerEventInitServer(
    _ServerEventInitServer event,
    Emitter<ServerState> emit,
  ) async {
    if (state.isServerActive) {
      return;
    }
    try {
      final staticUrl = await NetworkAp().getIpAddress();
      if (staticUrl.isEmpty) return;
      await _copyAssetsToDocuments();
      final directory = await getApplicationDocumentsDirectory();
      final staticHandler = createStaticHandler(
        '${directory.path}/$browserPath',
        defaultDocument: 'index.html',
      );

  //     final pipeline = const Pipeline().addMiddleware(createMiddleware(requestHandler: (p0) async {
  //       print(
  // '''
  // headers: ${p0.headers}
  // requestedUri: ${p0.requestedUri}
  // '''
  //       );
  //     },)).addHandler(staticHandler);

      final handler = Router()..post('/', _handlePostRequest);

      final cascade = Cascade().add(handler).add(staticHandler);

      final server = await shelf_io.serve(
        cascade.handler,
        staticUrl,
        staticPort,
        shared: true,
      );

      emit(state.copyWith(server: server, isServerActive: true, url: 'http://$staticUrl:$staticPort'));
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  void _onServerEventCloseServer(
    _ServerEventCloseServer event,
    Emitter<ServerState> emit,
  ) async {
    if (state.isServerActive && state.server != null) {
      await state.server!.close(force: true);
      emit(state.copyWith(isServerActive: false, server: null, url: null));
    }
  }

  Future<void> _copyAssetsToDocuments() async {
    final directory = await getApplicationDocumentsDirectory();
    final assets = await rootBundle.loadString('AssetManifest.json');
    var assetList = jsonDecode(assets) as Map<String, dynamic>;
    assetList.removeWhere(
      (key, value) => !key.contains(browserPath) || key.contains('$browserPath/.'),
    );

    for (final assetPath in assetList.keys) {
      try {
        final assetData = await rootBundle.load(assetPath);
        String correctedAssetPath = assetPath.substring(assetPath.indexOf(browserPath));
        final file = File('${directory.path}/$correctedAssetPath');
        await file.create(recursive: true);
        await file.writeAsBytes(assetData.buffer.asUint8List());
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  Future<Response> _handlePostRequest(Request request) async {
    final params = await request.readAsString();
    final clientAddress = (request.context['shelf.io.connection_info'] as
    HttpConnectionInfo?);
    print('SARASA request params: $params, clientAddress: ${clientAddress?.remoteAddress}');
    return Response.ok(null);
  }
}
