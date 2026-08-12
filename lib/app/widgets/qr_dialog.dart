import 'package:flutter/material.dart';

class QrDialog extends StatelessWidget {
  const QrDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: Text('Customer Payment QR Code'),
      content: Text('Scan QR code to pay'),
    );
  }
}
