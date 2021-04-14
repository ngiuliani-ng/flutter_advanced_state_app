import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_advanced_state_app/repositories/shoppingCart.dart';

import 'package:flutter_advanced_state_app/models/product.dart';

import 'package:flutter_advanced_state_app/main.dart';

class ShoppingCartBloc extends Bloc<ShoppingCartEvent, ShoppingCartState> {
  ShoppingCartBloc(ShoppingCartState initialState) : super(initialState);

  @override
  Stream<ShoppingCartState> mapEventToState(ShoppingCartEvent event) async* {
    if (event is ShoppingCartAddProductEvent) {
      final productToAdd = event.product;
      final newShoppingCart = getIt<ShoppingCartRepository>().addProduct(productToAdd);
      yield ShoppingCartState(newShoppingCart);
    } else if (event is ShoppingCartRemoveProductEvent) {
      final productToRemove = event.product;
      final newShoppingCart = getIt<ShoppingCartRepository>().removeProduct(productToRemove);
      yield ShoppingCartState(newShoppingCart);
    }
  }
}

abstract class ShoppingCartEvent {}

class ShoppingCartAddProductEvent extends ShoppingCartEvent {
  ShoppingCartAddProductEvent(
    this.product,
  );

  ProductModel product;
}

class ShoppingCartRemoveProductEvent extends ShoppingCartEvent {
  ShoppingCartRemoveProductEvent(
    this.product,
  );

  ProductModel product;
}

class ShoppingCartState {
  ShoppingCartState(
    this.products,
  );

  List<ProductModel> products;
}
