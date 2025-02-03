import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart' hide Router;
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_static/shelf_static.dart';

const _host = 'localhost';
const _port = 5000;
const browserPath = 'browser';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final app = Router();
  app.post('/a', (Request request) async {
    final params = await request.readAsString();
    print('SARASA params: $params');
    return Response.ok(null);
  });
  // app.get(route, handler)

  await _copyAssetsToDocuments();
  final directory = await getApplicationDocumentsDirectory();
  final staticHandler = createStaticHandler(
    '${directory.path}/$browserPath',
    defaultDocument: 'index.html',
  );
  final cascade = Cascade().add(app).add(staticHandler);
  // final handler = shelf.Pipeline()
  // .addMiddleware((innerHandler) => (request) async {
  //   return shelf.Response.ok('Hello World');
  // });
  await shelf_io.serve(
    cascade.handler,
    _host,
    _port,
    // shared: true,
  );

  // final server = await HttpServer.bind(_host, _port);
  // final ioServer = shelf_io.IOServer(server);

  // final ioServer = await shelf_io.IOServer.bind(_host, _port);
  // ioServer.mount((request) => shelf.Response.ok('Hello World3'));
  // print('SARASA serving at http://${server.address.host}:${server.port}');
  runApp(const Placeholder());
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
    } catch (err) {
      print('SARASA ${err.toString()}');
    }
  }
}
