import 'package:flutter_advanced_state_app/models/product.dart';

class ShoppingCartRepository {
  List<ProductModel> products = [];

  List<ProductModel> addProduct(ProductModel product) {
    products.add(product);
    return products;
  }

  List<ProductModel> removeProduct(ProductModel product) {
    products.remove(product);
    return products;
  }
}
