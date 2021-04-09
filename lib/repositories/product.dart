import 'package:flutter_advanced_state_app/models/product.dart';

class ProductRepository {
  Future<List<ProductModel>> all() async {
    await Future.delayed(
      Duration(
        seconds: 3,
      ),
    );
    return fakeProducts;
  }
}

final List<ProductModel> fakeProducts = [
  ProductModel(
    id: '000',
    name: 'MINIGONNA SPACCHI LATERALI',
    price: 17.99,
    imageUrl: 'https://static.bershka.net/4/photos2/2021/V/0/1/p/0802/168/712/0802168712_2_7_3.jpg?t=1617876943390',
  ),
  ProductModel(
    id: '001',
    name: 'BORSA CATENA',
    price: 12.99,
    imageUrl: 'https://static.bershka.net/4/photos2/2021/V/0/1/p/3481/266/047/3481266047_1_1_3.jpg?t=1615224185449',
  ),
  ProductModel(
    id: '002',
    name: 'VESTITO SPALLINE',
    price: 15.99,
    imageUrl: 'https://static.bershka.net/4/photos2/2021/V/0/1/p/0172/058/520/0172058520_1_3_3.jpg?t=1617876148300',
  ),
  ProductModel(
    id: '003',
    name: 'SET GILET E GONNA',
    price: 37.98,
    imageUrl: 'https://static.bershka.net/4/photos2/2021/V/0/1/b/0746/168/712/BS/BS/0746168712_2_7_3.jpg?t=1617908853274',
  ),
  ProductModel(
    id: '004',
    name: 'SET TOP E GONNA SATIN',
    price: 43.98,
    imageUrl: 'https://static.bershka.net/4/photos2/2021/V/0/1/b/3217/187/520/BS/BS/3217187520_1_3_3.jpg?t=1617908853922',
  ),
  ProductModel(
    id: '005',
    name: 'MINI BORSA MULTICATENE',
    price: 12.99,
    imageUrl: 'https://static.bershka.net/4/photos2/2021/V/0/1/p/3476/266/047/3476266047_1_1_3.jpg?t=1614178045088',
  ),
  ProductModel(
    id: '006',
    name: 'MAGLIETTA A COSTE LACE UP',
    price: 15.99,
    imageUrl: 'https://static.bershka.net/4/photos2/2021/V/0/1/p/2156/187/250/2156187250_1_3_3.jpg?t=1617877583109',
  ),
  ProductModel(
    id: '007',
    name: 'TOP LACE UP STRASS',
    price: 17.99,
    imageUrl: 'https://static.bershka.net/4/photos2/2021/V/0/1/p/3206/376/520/3206376520_1_3_3.jpg?t=1617876944090',
  ),
  ProductModel(
    id: '008',
    name: 'SANDALI VINILE',
    price: 29.99,
    imageUrl: 'https://static.bershka.net/4/photos2/2021/V/1/1/p/1707/760/087//01/1707760087_2_4_3.jpg?t=1612884950536',
  ),
  ProductModel(
    id: '009',
    name: 'SHORTS DENIM BIKINI',
    price: 29.99,
    imageUrl: 'https://static.bershka.net/4/photos2/2021/V/0/1/p/2569/179/428/2569179428_1_3_3.jpg?t=1617908831050',
  ),
];
