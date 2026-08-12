import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;

  const ConfirmationDialog({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: const Text('Confirm action?'),
    );
  }
}
