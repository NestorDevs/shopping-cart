import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../product/controllers/product_controller.dart';
import 'cart_view_model.dart';

class CartView extends CartViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: context.watch<ProductController>().basketItems.length,
              itemBuilder: (context, index) {
                final product =
                    context.watch<ProductController>().basketItems[index];
                return Column(
                  children: [
                    Image.network(
                      product.image,
                      height: 200,
                      width: 200,
                    ),
                    const SizedBox(height: 20),
                    Text(
                        "${context.watch<ProductController>().basketProducts[product]} * ${product.price}"),
                    const SizedBox(height: 20),
                  ],
                );
              },
            ),
          ),
          ElevatedButton(
            child: const Text("Minimum 100 \$"),
            onPressed: context.watch<ProductController>().basketTotalMoney > 100
                ? () {}
                : null,
          )
        ],
      ),
    );
  }
}
