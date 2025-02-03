import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrView extends StatelessWidget {
  final String title;
  final String data;
  final double? size;

  const QrView({
    super.key,
    required this.title,
    required this.data,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute<void>(
          builder: (BuildContext context) => GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Scaffold(
              appBar: AppBar(title: Text(title, style: const TextStyle(fontSize: 25)), centerTitle: true),
              body: Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Hero(
                    tag: title,
                    child: QrImageView(data: data),
                  ),
                ),
              ),
            ),
          ),
        ));
      },
      child: Hero(
        tag: title,
        child: QrImageView(
          data: data,
          size: size,
        ),
      ),
    );
  }
}
