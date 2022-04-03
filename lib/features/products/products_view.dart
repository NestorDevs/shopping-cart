import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../product/controllers/product_controller.dart';
import '../../product/widgets/card/shop_cart.dart';
import 'model/product_model.dart';
import 'products_view_model.dart';

class ProductsView extends ProductsViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [buildActionChipTotalMoney()],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ShopCart(
              product: Product(
            id: products[index].id,
            title: products[index].title,
            price: products[index].price,
            description: products[index].description,
            category: products[index].category,
            image: products[index].image,
            rating: products[index].rating,
          ));
        },
      ),
    );
  }

  ActionChip buildActionChipTotalMoney() {
    return ActionChip(
      avatar: const Icon(Icons.check, color: Colors.green),
      label: Text("${context.watch<ProductController>().basketTotalMoney} TL"),
      onPressed: () {},
    );
  }
}
