import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_advanced_state_app/blocs/shoppingCart.dart';

import 'package:flutter_advanced_state_app/models/product.dart';

class CheckoutPage extends StatefulWidget {
  static String routeName = '/home/checkout';

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
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
      title: Text('My Order'),
      centerTitle: true,
      elevation: 0,
    );
  }

  Widget body(BuildContext context) {
    return BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
      builder: (context, state) {
        List<ProductModel> products = state.products;
        final totalCost = (products.length > 0) ? (products.map((e) => e.price).reduce((value, element) => value + element).toStringAsFixed(2)) : '0.00';
        return Column(
          children: [
            Expanded(
              child: listCheckout(
                products: products,
              ),
            ),
            listFooter(
              totalCost: totalCost,
            ),
          ],
        );
      },
    );
  }

  Widget listCheckout({
    @required List<ProductModel> products,
  }) {
    return Padding(
      /**
       * T: 8 px. [listFooter]
       * B: 8 px. [listCheckout]
       */
      padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: ListView.separated(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return singleProduct(
            index: index,
            product: product,
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 16,
          );
        },
      ),
    );
  }

  Widget singleProduct({
    @required int index,
    @required ProductModel product,
  }) {
    return Row(
      children: [
        Container(
          width: 120,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: NetworkImage(product.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.name),
              SizedBox(
                height: 5,
              ),
              Text(
                '\$ ${product.price}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.delete,
            color: Colors.grey,
          ),
          splashRadius: 25,
          onPressed: () {
            BlocProvider.of<ShoppingCartBloc>(context).add(ShoppingCartRemoveEvent(product));
            print('${product.id} Removed Product');
          },
        ),
      ],
    );
  }

  Widget listFooter({
    @required String totalCost,
  }) {
    return Padding(
      /**
       * T: 8 px. [listFooter]
       * B: 8 px. [listCheckout]
       */
      padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Text(
                '\$ $totalCost',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 24,
          ),
          MaterialButton(
            child: Text('Pay Now'),
            minWidth: double.infinity,
            height: 50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            color: Colors.black,
            textColor: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
