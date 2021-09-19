import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class BarcodeScanScreen extends StatelessWidget {
  BarcodeScanScreen({Key? key}) : super(key: key);

  static const routeName = '/scan';

  final qrKey = GlobalKey(debugLabel: 'QR');

  void _onQRViewCreated(BuildContext context, QRViewController controller) async {
    final scanned = await controller.scannedDataStream.first;
    Navigator.of(context).pop(scanned.code);
  }

  @override
  Widget build(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: (controller) => _onQRViewCreated(context, controller),
    );
  }
}
