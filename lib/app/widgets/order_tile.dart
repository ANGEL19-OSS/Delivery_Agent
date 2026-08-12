import 'package:flutter/material.dart';

class OrderTile extends StatelessWidget {
  final String orderId;
  final VoidCallback? onTap;

  const OrderTile({
    super.key,
    required this.orderId,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Order $orderId'),
      onTap: onTap,
    );
  }
}
