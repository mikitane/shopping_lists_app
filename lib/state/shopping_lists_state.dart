import 'package:collection/collection.dart' show IterableExtension;
import 'package:flutter/material.dart';
import 'package:shopping_lists_app/models/shopping_list_model.dart';

class ShoppingListsState extends ChangeNotifier {
  ShoppingListsState({shoppingLists = const []})
      : _shoppingLists = shoppingLists;

  final List<ShoppingListModel> _shoppingLists;

  List<ShoppingListModel> get shoppingLists => _shoppingLists;

  ShoppingListModel? getShoppingListById(String id) => _shoppingLists
      .singleWhereOrNull((shoppingList) => shoppingList.id == id);
}
