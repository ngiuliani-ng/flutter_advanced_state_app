import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_advanced_state_app/blocs/allProducts.dart';
import 'package:flutter_advanced_state_app/blocs/shoppingCart.dart';

import 'package:flutter_advanced_state_app/models/product.dart';

import 'package:flutter_advanced_state_app/pages/checkout.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AllProductsBloc>(context).add(AllProductsEvent.Get);
  }

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
    return BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
      builder: (context, state) {
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
                    state.products.length.toString(),
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
      },
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
    return BlocBuilder<AllProductsBloc, AllProductsState>(
      builder: (context, state) {
        if (state is AllProductsLoadingState) {
          return SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          final products = (state as AllProductsLoadedState).products;
          return SliverPadding(
            /**
             * T: 8 px.  [gridProducts]
             * B: 8 px.  [gridHeader]
             */
            padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
            sliver: BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
              builder: (context, state) {
                return SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final product = products[index];
                      final isProductInShoppingCart = state.products.contains(product);
                      return singleProduct(
                        index: index,
                        product: product,
                        isProductInShoppingCart: isProductInShoppingCart,
                      );
                    },
                    childCount: products.length,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.65,
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }

  Widget singleProduct({
    @required int index,
    @required ProductModel product,
    @required bool isProductInShoppingCart,
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
              image: DecorationImage(
                image: NetworkImage(product.imageUrl),
                fit: BoxFit.cover,
              ),
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
                  Text(product.name),
                  SizedBox(
                    height: 5,
                  ),
                  // TODO: Importo totalmente in basso indipendente dal nome dell'oggetto.
                  Text(
                    '\$ ${product.price}',
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
                color: isProductInShoppingCart ? Colors.red : Colors.grey,
              ),
              splashRadius: 25,
              onPressed: () {
                if (isProductInShoppingCart) {
                  BlocProvider.of<ShoppingCartBloc>(context).add(ShoppingCartRemoveEvent(product));
                  print('${product.id} Removed Product');
                } else {
                  BlocProvider.of<ShoppingCartBloc>(context).add(ShoppingCartAddEvent(product));
                  print('${product.id} Added Product');
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
