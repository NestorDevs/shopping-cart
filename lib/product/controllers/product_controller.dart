import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../features/products/model/product_model.dart';
import '../services/product_service.dart';

class ProductController extends ChangeNotifier {
  Map<Product, int> basketProducts = {};

  late ProductService service;

  ProductController(BuildContext context) {
    service = context.read<ProductService>();
  }

  List<Product> get basketItems => basketProducts.keys.toList();

  double get basketTotalMoney {
    if (basketProducts.isEmpty) {
      return 0;
    } else {
      double _total = 0;
      basketProducts.forEach((key, value) {
        _total += key.price * value;
      });
      return _total;
    }
  }

  int get totalProducts {
    return basketProducts.length;
  }

  void addFirstItemToCart(Product product) {
    basketProducts[product] = 1;
    service.addProductToCart(product);
    notifyListeners();
  }

  void incrementProduct(Product product) {
    if (basketProducts[product] == null) {
      addFirstItemToCart(product);
      return;
    } else {
      var value = basketProducts[product];
      if (value != null) {
        value++;
        basketProducts[product] = value;
      }
    }
    notifyListeners();
  }

  void increseProduct(Product product) {
    if (basketProducts[product] == null) return;
    if (basketProducts[product] == 0) {
      print('====entrando aca====');
      basketProducts.removeWhere((key, value) => key == product);
    } else {
      print('====nada por aqui====');
      var value = basketProducts[product];
      if (value != null) {
        value--;
        basketProducts[product] = value;
      }
    }
    notifyListeners();
  }
}
