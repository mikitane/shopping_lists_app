import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shopping_lists_app/widgets/common/custom_app_bar.dart';
import 'package:shopping_lists_app/widgets/shopping_lists/shopping_lists.dart';

class ShoppingListsScreen extends StatelessWidget {
  static const routeName = '/shoppingLists';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context).shoppingListsHeader,
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
        toolbarHeight: 90.0,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(child: ShoppingLists()),

            // TODO: Create common widget
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child: ElevatedButton.icon(
                onPressed: () => {},
                icon: Icon(Icons.add,
                    color: Theme.of(context).colorScheme.onPrimary, size: 28),
                label: Text(
                  AppLocalizations.of(context).newShoppingListLabel,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                  elevation: MaterialStateProperty.all(0),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 12, horizontal: 20)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
