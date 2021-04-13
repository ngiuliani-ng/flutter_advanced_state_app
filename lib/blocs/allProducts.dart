import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_advanced_state_app/repositories/product.dart';

import 'package:flutter_advanced_state_app/models/product.dart';

import 'package:flutter_advanced_state_app/main.dart';

class AllProductsBloc extends Bloc<AllProductsEvent, AllProductsState> {
  AllProductsBloc(AllProductsState initialState) : super(initialState);

  @override
  Stream<AllProductsState> mapEventToState(AllProductsEvent event) async* {
    if (event == AllProductsEvent.Get) {
      final products = await getIt.get<ProductRepository>().all();
      yield AllProductsLoadedState(products);
    }
  }
}

enum AllProductsEvent {
  Get,
}

abstract class AllProductsState {}

class AllProductsLoadingState extends AllProductsState {}

class AllProductsLoadedState extends AllProductsState {
  AllProductsLoadedState(
    this.products,
  );

  List<ProductModel> products;
}
