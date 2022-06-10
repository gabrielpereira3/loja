import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen(this.orderId, {Key? key}) : super(key: key);

  final String orderId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pedido finalizado"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check,
              color: Theme.of(context).primaryColor,
              size: 80,
            ),
            const Text(
              "Pedido realizado com sucesso",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Código do pedido: $orderId",
              style: const TextStyle(
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
