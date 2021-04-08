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
      title: Text('My Order'),
      centerTitle: true,
      elevation: 0,
    );
  }

  Widget body(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: listCheckout(),
        ),
        listFooter(),
      ],
    );
  }

  Widget listCheckout() {
    return Padding(
      /**
       * T: 8 px. [listFooter]
       * B: 8 px. [listCheckout]
       */
      padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) {
          return singleProduct(
            index: index,
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
  }) {
    return Row(
      children: [
        Container(
          width: 120,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nome Oggetto'),
            SizedBox(
              height: 5,
            ),
            Text(
              '\$ 9.99',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Icon(
              Icons.favorite,
              color: Colors.grey,
            ),
          ],
        ),
      ],
    );
  }

  Widget listFooter() {
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
                '\$ 99.99',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
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
            onPressed: () {
              print('Pay Now');
            },
          ),
        ],
      ),
    );
  }
}
