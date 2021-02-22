import 'package:flutter/material.dart';
import 'package:shopping_lists_app/models/product_model.dart';
import 'package:uuid/uuid.dart';

class ShoppingListModel {
  ShoppingListModel(
      {@required this.id, @required this.name, @required this.products});

  String id;
  String name;
  List<ProductModel> products;
}
