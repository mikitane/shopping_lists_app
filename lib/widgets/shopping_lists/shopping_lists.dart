import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_lists_app/state/shopping_lists_state.dart';
import 'package:shopping_lists_app/models/shopping_list_model.dart';
import 'package:shopping_lists_app/widgets/shopping_lists/shopping_list_item.dart';

class ShoppingLists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<ShoppingListModel> shoppingLists =
        context.select((ShoppingListsState state) => state.shoppingLists);

    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 12),
      itemCount: shoppingLists.length,
      itemBuilder: (context, index) {
        return ShoppingListItem(shoppingList: shoppingLists[index]);
      },
      separatorBuilder: (BuildContext context, int index) => Container(
        width: double.infinity,
        height: 12,
      ),
    );
  }
}