import 'package:flutter/material.dart';
import 'package:shopping_lists_app/data/models/shopping_list/shopping_list_model.dart';
import 'package:shopping_lists_app/widgets/shopping_lists/shopping_list_item.dart';

class ShoppingLists extends StatelessWidget {
  ShoppingLists({ required this.shoppingLists });

  final List<ShoppingListModel> shoppingLists;

  @override
  Widget build(BuildContext context) {

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