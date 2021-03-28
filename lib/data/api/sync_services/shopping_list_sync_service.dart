import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_lists_app/data/api/config.dart';
import 'package:shopping_lists_app/data/hive.dart';
import 'package:shopping_lists_app/data/models/shopping_list/shopping_list_model.dart';
import 'package:shopping_lists_app/providers.dart';

Future<void> syncShoppingListsToServer(
    Reader read, Map<String, String> defaultHeaders) async {
      print('Start syncShoppingListsToServer');

  final box = Hive.box<ShoppingListModel>(modelBoxMapping[ShoppingListModel]!);


  final shoppingLists = box.values.toList();
  final shoppingListsToSync = shoppingLists.where((list) => list.needsSync);

  await Future.forEach(shoppingListsToSync, (ShoppingListModel shoppingList) async {
    print('Sync syncShoppingListsToServer');
    final shoppingListJson = json.encode(shoppingList.toJson());
    final uri = Uri.parse(BASE_URL + '/shopping-list');
    final res =
        await http.post(uri, body: shoppingListJson, headers: defaultHeaders);

    print(res.body);

    box.put(shoppingList.id, shoppingList.copyWith(needsSync: false));
  });

  print('End syncShoppingListsToServer');
}

// void syncShoppingListsFromServer() {

// }
