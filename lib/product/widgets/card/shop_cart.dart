import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../features/products/model/product_model.dart';
import '../../controllers/product_controller.dart';

class ShopCart extends StatelessWidget {
  final Product product;

  const ShopCart({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        trailing: IconButton(
          icon: const Icon(Icons.shopping_basket),
          onPressed: () {
            context.read<ProductController>().addFirstItemToCart(product);
          },
        ),
        title: buildSizedBoxImage(context),
        subtitle: buildWrapSub(),
      ),
    );
  }

  Widget buildSizedBoxImage(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: Image.network(product.image)),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Container(
          color: Colors.black12,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  context.read<ProductController>().incrementProduct(product);
                },
              ),
              Text(
                  "${context.watch<ProductController>().basketProducts[product] ?? 0}"),
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  context.read<ProductController>().increseProduct(product);
                },
              ),
            ],
          ),
        )
      ],
    );
  }

  Wrap buildWrapSub() {
    return Wrap(
      spacing: 10,
      runSpacing: 15,
      children: [
        Text(product.title),
        Text(product.description),
        Text('Category: ${product.category}'),
        Text("${product.price}"),
      ],
    );
  }
}
