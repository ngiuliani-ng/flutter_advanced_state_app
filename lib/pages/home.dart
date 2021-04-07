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
        shoppingCart(),
      ],
    );
  }

  Widget shoppingCart() {
    return Stack(
      children: [
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            print('Shopping Cart');
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
    return GestureDetector(
      onTap: () {
        print('Single Product $index');
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(16),
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
                    // TODO: Importo totalmente in basso indipendente dal nome dell'oggetto.
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
                  ],
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Icon(
                Icons.favorite,
                color: Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
