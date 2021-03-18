import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shopping_lists_app/data/models/base_model_interface.dart';
import 'package:shopping_lists_app/data/models/product_model.dart';
import 'package:uuid/uuid.dart';

part 'shopping_list_model.g.dart';

@HiveType(typeId: 0)
class ShoppingListModel extends HiveObject implements BaseModelInterface {
  ShoppingListModel(
      {required this.name, required this.lastModified, this.products = const [], id}) : this.id = id ?? Uuid().v4();

  @HiveField(0)
  late final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final List<ProductModel> products;

  @HiveField(3)
  final DateTime lastModified;
}
