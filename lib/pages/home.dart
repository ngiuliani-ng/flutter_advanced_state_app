import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  Widget body() {
    return CustomScrollView(
      slivers: [
        appBar(),
        gridHeader(),
        gridProducts(),
      ],
    );
  }

  Widget appBar() {
    return SliverAppBar(
      floating: true,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.person),
        onPressed: () {
          print('Profile');
        },
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            print('Shopping Cart');
          },
        ),
      ],
    );
  }

  Widget gridHeader() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(16),
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
      padding: EdgeInsets.all(16),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return singleProduct();
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

  Widget singleProduct() {
    return Container(
      color: Colors.grey,
    );
  }
}
