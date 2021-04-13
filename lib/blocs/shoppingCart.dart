import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_advanced_state_app/repositories/shoppingCart.dart';

import 'package:flutter_advanced_state_app/models/product.dart';

import 'package:flutter_advanced_state_app/main.dart';

class ShoppingCartBloc extends Bloc<ShoppingCartEvent, ShoppingCartState> {
  ShoppingCartBloc(ShoppingCartState initialState) : super(initialState);

  @override
  Stream<ShoppingCartState> mapEventToState(ShoppingCartEvent event) async* {
    if (event is ShoppingCartAddEvent) {
      final productToAdd = event.product;
      final newShoppingCart = getIt<ShoppingCartRepository>().addProduct(productToAdd);
      yield ShoppingCartState(newShoppingCart);
    } else if (event is ShoppingCartRemoveEvent) {
      final productToRemove = event.product;
      final newShoppingCart = getIt<ShoppingCartRepository>().removeProduct(productToRemove);
      yield ShoppingCartState(newShoppingCart);
    } else if (event is ShoppingCartGetEvent) {
      final shoppingCart = getIt<ShoppingCartRepository>().products;
      yield ShoppingCartState(shoppingCart);
    }
  }
}

abstract class ShoppingCartEvent {}

class ShoppingCartAddEvent extends ShoppingCartEvent {
  ShoppingCartAddEvent(
    this.product,
  );

  ProductModel product;
}

class ShoppingCartRemoveEvent extends ShoppingCartEvent {
  ShoppingCartRemoveEvent(
    this.product,
  );

  ProductModel product;
}

class ShoppingCartGetEvent extends ShoppingCartEvent {}

class ShoppingCartState {
  ShoppingCartState(
    this.products,
  );

  List<ProductModel> products;
}
