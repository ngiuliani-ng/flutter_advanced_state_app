import 'package:flutter/material.dart';

class ProductModel {
  ProductModel({
    @required this.id,
    @required this.name,
    @required this.price,
    @required this.image,
  });

  final String id;
  final String name;
  final double price;
  final Uri image;
}
