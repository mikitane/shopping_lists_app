import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shopping_lists_app/global_state/shopping_lists_state.dart';
import 'package:shopping_lists_app/models/product_model.dart';
import 'package:shopping_lists_app/models/shopping_list_model.dart';
import 'package:shopping_lists_app/widgets/shopping_lists/shopping_list_item.dart';
import 'package:shopping_lists_app/widgets/shopping_lists/shopping_lists.dart';

class ShoppingListsScreen extends StatelessWidget {
  static const routeName = '/shoppingLists';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(AppLocalizations.of(context).shoppingListsHeader)),
      body: ShoppingLists(),
    );
  }
}
