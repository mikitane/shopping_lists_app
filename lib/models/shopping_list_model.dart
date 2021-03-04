import 'package:flutter/material.dart';
import 'package:shopping_lists_app/models/product_model.dart';
import 'package:uuid/uuid.dart';

class ShoppingListModel {
  ShoppingListModel(
      {@required this.name, this.products = const [], id}) {
    this.id = id ?? Uuid().v4();
  }

  String id;
  String name;
  List<ProductModel> products;
}
