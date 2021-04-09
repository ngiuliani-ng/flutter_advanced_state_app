import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_advanced_state_app/pages/home.dart';
import 'package:flutter_advanced_state_app/pages/checkout.dart';

void main() {
  runApp(App());
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
      ),
      routes: {
        HomePage.routeName: (_) => HomePage(),
        CheckoutPage.routeName: (_) => CheckoutPage(),
      },
    );
  }
}
