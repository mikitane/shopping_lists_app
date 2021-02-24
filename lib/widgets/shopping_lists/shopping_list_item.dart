import 'package:flutter/material.dart';
import 'package:shopping_lists_app/models/shopping_list_model.dart';
import 'package:shopping_lists_app/screens/shopping_list_details_screen.dart';

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({this.shoppingList});

  final ShoppingListModel shoppingList;

  @override
  Widget build(BuildContext context) {
    int doneProductsCount =
        shoppingList.products.where((product) => product.done).length;
    int totalProductsCount = shoppingList.products.length;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ShoppingListScreen.routeName,
          arguments:
              ShoppingListDetailsScreenArguments(shoppingListId: shoppingList.id),
        );
      },
      child: Card(
        elevation: 4,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              shoppingList.name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              '$doneProductsCount/$totalProductsCount',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).primaryColor,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
