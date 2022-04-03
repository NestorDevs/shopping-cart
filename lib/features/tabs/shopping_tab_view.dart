import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/features/cart/cart.dart';
import 'package:shopping_cart/features/products/products.dart';

import '../../product/controllers/product_controller.dart';

class ShoppingTabView extends StatelessWidget {
  const ShoppingTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: buildBottomAppBar(context),
        body: const TabBarView(
          children: [
            Products(),
            Cart(),
          ],
        ),
      ),
    );
  }

  BottomAppBar buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      elevation: 20,
      child: TabBar(
        labelPadding: EdgeInsets.zero,
        indicatorPadding: EdgeInsets.zero,
        tabs: [
          const Tab(
            icon: Icon(Icons.home),
          ),
          Tab(
            icon: Stack(
              children: [
                const Icon(Icons.shopping_basket),
                Positioned(
                  top: 0,
                  right: 0,
                  height: 10,
                  width: 10,
                  child: buildCircleAvatarCounter(context),
                ),
              ],
            ),
          ),
        ],
        labelColor: Colors.black,
      ),
    );
  }

  CircleAvatar buildCircleAvatarCounter(BuildContext context) {
    return CircleAvatar(
        backgroundColor: Colors.red,
        child: Text(
          context.watch<ProductController>().totalProducts.toString(),
          style: Theme.of(context)
              .textTheme
              .overline!
              .copyWith(color: Colors.white),
        ));
  }
}
