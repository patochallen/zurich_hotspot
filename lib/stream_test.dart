import 'package:flutter/material.dart';
import 'package:network_ap/network_ap.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
          body: StreamBuilder(
              stream: NetworkAp().readyToStart(),
              builder: (context, snapshot) {
                print('SARASA build: ${snapshot.data}');
                return Center(
                  child: Text((snapshot.data ?? false).toString(), style: TextStyle(fontSize: 35)),
                );
              }
          ),
      ),
    );
  }
}
