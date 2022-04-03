import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/tabs/shopping_tab_view.dart';
import 'product/controllers/product_controller.dart';
import 'product/services/product_service.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          Provider<ProductService>(create: ((context) => ProductService())),
          ChangeNotifierProvider(
            create: (context) => ProductController(context),
          ),
        ],
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping Cart App',
      home: ShoppingTabView(),
    );
  }
}
