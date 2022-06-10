import 'package:flutter/material.dart';

class OrderTile extends StatelessWidget {
  const OrderTile(this.orderId, {Key? key}) : super(key: key);

  final String orderId;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(orderId),
    );
  }
}
