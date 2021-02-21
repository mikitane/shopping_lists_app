import 'package:flutter/material.dart';
import 'package:shopping_lists_app/models/product_model.dart';

class ShoppingListModel {
  ShoppingListModel({@required this.name, @required this.products});

  String name;
  List<ProductModel> products;
}