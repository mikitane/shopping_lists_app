import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shopping_lists_app/models/product_model.dart';
import 'package:shopping_lists_app/models/shopping_list_model.dart';
import 'package:shopping_lists_app/widgets/shopping_lists/shopping_list_item.dart';

class ShoppingLists extends StatelessWidget {
  final List<ShoppingListModel> shoppingLists = [
    ShoppingListModel(
      name: 'Kauppalista',
      products: [
        ProductModel(name: 'Maito', done: true),
        ProductModel(name: 'Leipä', done: false)
      ],
    ),
    ShoppingListModel(name: 'Rautakauppalista', products: [])
  ];

  ListView _buildListView() {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(AppLocalizations.of(context).shoppingListsHeader)),
        body: _buildListView());
  }
}
