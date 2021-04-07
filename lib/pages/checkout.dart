import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  static String routeName = '/home/checkout';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: body(context),
    );
  }

  Widget appBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      elevation: 0,
    );
  }

  Widget body(BuildContext context) {
    return Container();
  }
}
