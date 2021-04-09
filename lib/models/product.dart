import 'package:flutter/material.dart';

class ProductModel {
  ProductModel({
    @required this.id,
    @required this.name,
    @required this.price,
    @required this.imageUrl,
  });

  final String id;
  final String name;
  final double price;
  final String imageUrl;
}
