import 'package:flutter/material.dart';

import 'package:flutter_advanced_state_app/pages/checkout.dart';

class HomePage extends StatelessWidget {
  static String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    return CustomScrollView(
      slivers: [
        appBar(context),
        gridHeader(),
        gridProducts(),
      ],
    );
  }

  Widget appBar(BuildContext context) {
    return SliverAppBar(
      floating: true,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.person),
        onPressed: () {
          // TODO: ProfilePage.
        },
      ),
      actions: [
        shoppingCart(context),
      ],
    );
  }

  Widget shoppingCart(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.pushNamed(context, CheckoutPage.routeName);
          },
        ),
        Positioned(
          top: 2.5,
          right: 2.5,
          child: Container(
            // Circle Inf.
            width: 21,
            height: 21,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          top: 2.5,
          right: 2.5,
          child: Container(
            // Circle Sup.
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '10',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.5,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget gridHeader() {
    /**
     * E' stato utilizzato [SliverToBoxAdapter]
     * perchè [SliverPadding] non supporta [Column] come sliver.
     */
    return SliverToBoxAdapter(
      child: Padding(
        /**
         * T: 8 px.  [gridProducts]
         * B: 8 px.  [gridHeader]
         */
        padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Our',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            Text(
              'Products',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget gridProducts() {
    return SliverPadding(
      /**
       * T: 8 px.  [gridProducts]
       * B: 8 px.  [gridHeader]
       */
      padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return singleProduct(
              index: index,
            );
          },
          childCount: 10,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.65,
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
      ),
    );
  }

  Widget singleProduct({
    @required int index,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // TODO: DetailsPage.
          },
          child: Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nome Oggetto'),
                  SizedBox(
                    height: 5,
                  ),
                  // TODO: Importo totalmente in basso indipendente dal nome dell'oggetto.
                  Text(
                    '\$ 9.99',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 8,
            ),
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.grey,
              ),
              splashRadius: 25,
              onPressed: () {
                print('Single Product $index - Add');
              },
            ),
          ],
        ),
      ],
    );
  }
}
