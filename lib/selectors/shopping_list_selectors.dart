import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_lists_app/data/models/shopping_list_model.dart';
import 'package:shopping_lists_app/providers.dart';

ShoppingListModel? prevList;

final singleShoppingListSelector = Provider.autoDispose.family<ShoppingListModel?, String>((ref, shoppingListId) {
  print('singleShoppingListSelector RUN');
  final shoppingListMap = ref.watch(shoppingListRepositoryProvider.state);
  final newList = shoppingListMap[shoppingListId];

  print('prevList $prevList');
  print('newList $newList');
  print('prevList == newList ${prevList == newList}');

  prevList = newList;
  return shoppingListMap[shoppingListId];
});