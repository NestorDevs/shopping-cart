import 'dart:io';

import 'package:dio/dio.dart';

import '../../features/products/model/product_model.dart';

class ProductService {
  late Dio dio;

  ProductService() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://fakestoreapi.com',
    ));
  }

  Future<List<Product>> getAllProducts() async {
    final response = await dio.get('/products');

    if (response.statusCode == HttpStatus.ok) {
      final responseBody = response.data as List;
      return responseBody.map((product) => Product.fromJson(product)).toList();
    }
    throw Exception('Failed to load products');
  }

  Future<bool> addProductToCart(Product product) async {
    final response = await dio.post(
      '/carts',
      data: product.toJson(),
      options: Options(headers: {"userId": "5"}),
    );

    if (response.statusCode == HttpStatus.ok) {
      return true;
    }
    throw Exception('Failed to add product to cart');
  }
}
