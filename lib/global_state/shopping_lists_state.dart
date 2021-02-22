import 'package:flutter/material.dart';
import 'package:shopping_lists_app/models/product_model.dart';
import 'package:shopping_lists_app/models/shopping_list_model.dart';
import 'package:uuid/uuid.dart';

class ShoppingListsState extends ChangeNotifier {
  final List<ShoppingListModel> _shoppingLists = [
    ShoppingListModel(
      id: Uuid().v4(),
      name: 'Kauppalista',
      products: [
        ProductModel(name: 'Maito', done: true),
        ProductModel(name: 'Leipä', done: false)
      ],
    ),
    ShoppingListModel(id: Uuid().v4(), name: 'Rautakauppalista', products: [])
  ];

  List<ShoppingListModel> get shoppingLists => _shoppingLists;

  ShoppingListModel getShoppingListById(Uuid id) => _shoppingLists
      .singleWhere((shoppingList) => shoppingList.id == id, orElse: () => null);
}
