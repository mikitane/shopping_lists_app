import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uuid/uuid.dart';

class ShoppingListScreenArguments {
  ShoppingListScreenArguments({this.shoppingListId});
  final String shoppingListId;
}

class ShoppingListScreen extends StatelessWidget {
  static const routeName = '/shoppingList';

  @override
  Widget build(BuildContext context) {
    final ShoppingListScreenArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar:
          AppBar(title: Text(AppLocalizations.of(context).shoppingListsHeader)),
      body: Center(
        child: Text('ShoppingListId: ${args.shoppingListId}'),
      ),
    );
  }
}
