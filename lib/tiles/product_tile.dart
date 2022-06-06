import 'package:flutter/material.dart';
import 'package:loja/datas/product_data.dart';

class ProductTile extends StatelessWidget {
  const ProductTile(this.type, this.product, {Key? key}) : super(key: key);

  final String type;
  final ProductData product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: type == "grid"
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 0.8,
                    child: Image.network(
                      product.images![0],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    product.title!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    "R\$ " + product.price.toString(),
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              )
            : Row(),
      ),
    );
  }
}
