import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../product/services/product_service.dart';
import 'model/product_model.dart';
import 'products.dart';

abstract class ProductsViewModel extends State<Products> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    getAllProducts();
  }

  Future<void> getAllProducts() async {
    products = await context.read<ProductService>().getAllProducts();
    setState(() {});
  }
}
