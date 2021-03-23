import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_lists_app/data/models/shopping_list/shopping_list_model.dart';
import 'package:shopping_lists_app/providers.dart';

ShoppingListModel? prevList;

final singleShoppingListSelector = Provider.autoDispose.family<ShoppingListModel?, String>((ref, shoppingListId) {
  final shoppingListMap = ref.watch(shoppingListRepositoryProvider.state);
  return shoppingListMap[shoppingListId];
});
