import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shopping_lists_app/global_state/shopping_lists_state.dart';
import 'package:shopping_lists_app/models/shopping_list_model.dart';
import 'package:shopping_lists_app/widgets/common/custom_app_bar.dart';
import 'package:shopping_lists_app/widgets/new_product/new_product.dart';
import 'package:shopping_lists_app/widgets/product_list/product_list.dart';

class ShoppingListDetailsScreenArguments {
  ShoppingListDetailsScreenArguments({this.shoppingListId});
  final String shoppingListId;
}

class ShoppingListScreen extends StatelessWidget {
  static const routeName = '/shoppingList';

  @override
  Widget build(BuildContext context) {
    final ShoppingListDetailsScreenArguments args =
        ModalRoute.of(context).settings.arguments;

    final ShoppingListModel shoppingList = context.select(
        (ShoppingListsState state) =>
            state.getShoppingListById(args.shoppingListId));

    return Scaffold(
      appBar:
          CustomAppBar(title: AppLocalizations.of(context).shoppingListHeader),
      body: Column(
        children: [
          Expanded(
            child: ProductList(
              products: shoppingList.products,
            ),
          ),
          NewProduct(),
        ],
      ),
    );
  }
}
