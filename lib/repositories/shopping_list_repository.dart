import 'dart:async';

import 'package:shopping_lists_app/models/shopping_list_model.dart';

class ShoppingListRepository {
  // TODO: Use real stream from database
  StreamController<List<ShoppingListModel>> shoppingListsStreamController =
      StreamController.broadcast();
  List<ShoppingListModel> shoppingLists = [
    ShoppingListModel(
      id: '1',
      name: 'Kauppalista',
    ),
    ShoppingListModel(
      id: '2',
      name: 'Viikonlopun kamat',
    ),
    ShoppingListModel(
      id: '3',
      name: 'Rautakauppalista',
    ),
  ];

  Stream<List<ShoppingListModel>> getShoppingListStream() {
    return shoppingListsStreamController.stream;
  }

  void createShoppingList(ShoppingListModel newShoppingList) {
    shoppingLists.add(newShoppingList);
    shoppingListsStreamController.add(shoppingLists);
  }
}
