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
  final box = Hive.box<ShoppingListModel>(modelBoxMapping[ShoppingListModel]!);

  final shoppingLists = box.values.toList();
  final shoppingListsToSync = shoppingLists.where((list) => list.needsSync);

  final shoppingListsJson =
      json.encode(shoppingListsToSync.map((list) => list.toJson()).toList());

  final uri = Uri.parse(BASE_URL + '/shopping-list');

  try {
    await http.post(uri, body: shoppingListsJson, headers: defaultHeaders);
  } catch (e) {
    print('syncShoppingListsToServer: Error');
    print(e);
    return;
  }

  shoppingListsToSync.forEach((list) {
    box.put(list.id, list.copyWith(needsSync: false));
  });
}

Future<void> syncShoppingListsFromServer(
    Reader read, Map<String, String> defaultHeaders) async {
  late final http.Response res;

  final uri = Uri.parse(BASE_URL + '/shopping-list');

  try {
    res = await http.get(uri, headers: defaultHeaders);
  } catch (e) {
    print('syncShoppingListsFromServer: Error');
    print(e);
    return;
  }

  final shoppingListsData = json.decode(res.body);
  final box = Hive.box<ShoppingListModel>(modelBoxMapping[ShoppingListModel]!);

  shoppingListsData.forEach((shoppingListData) {
    final shoppingList = ShoppingListModel.fromJson(shoppingListData);
    box.put(shoppingList.id, shoppingList);
  });
}
