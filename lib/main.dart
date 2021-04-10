import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:flutter_advanced_state_app/blocs/allProducts.dart';

import 'package:flutter_advanced_state_app/repositories/product.dart';

import 'package:flutter_advanced_state_app/pages/home.dart';
import 'package:flutter_advanced_state_app/pages/checkout.dart';

final getIt = GetIt.instance;

void main() {
  getIt.registerSingleton(ProductRepository());

  runApp(
    BlocProvider(
      create: (_) => AllProductsBloc(AllProductsLoadingState()),
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.black,
      ),
      routes: {
        HomePage.routeName: (_) => HomePage(),
        CheckoutPage.routeName: (_) => CheckoutPage(),
      },
      initialRoute: HomePage.routeName,
    );
  }
}
