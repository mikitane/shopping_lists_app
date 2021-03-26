import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shopping_lists_app/data/models/shopping_list/shopping_list_model.dart';
import 'package:shopping_lists_app/repositories/shopping_list_repository.dart';
import 'package:shopping_lists_app/providers.dart';
import 'package:shopping_lists_app/theme.dart';
import 'package:shopping_lists_app/widgets/common/custom_app_bar.dart';
import 'package:shopping_lists_app/widgets/common/custom_button.dart';
import 'package:shopping_lists_app/widgets/new_shopping_list/new_shopping_list.dart';
import 'package:shopping_lists_app/widgets/shopping_lists/shopping_lists.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShoppingListsScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _ShoppingListsScreenState createState() => _ShoppingListsScreenState();
}

class _ShoppingListsScreenState extends State<ShoppingListsScreen> {
  late ShoppingListRepository shoppingListRepository;

  @override
  void initState() {
    super.initState();
    shoppingListRepository = context.read(shoppingListRepositoryProvider);
  }

  void showNewShoppingListDialog() {
    showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return NewShoppingList();
        });
  }

  List<ShoppingListModel> sortShoppingLists(
      List<ShoppingListModel> shoppingLists) {
    final modifiedList = List<ShoppingListModel>.from(shoppingLists)
      ..sort((a, b) {
        return a.lastModified.compareTo(b.lastModified) * -1;
      });
    return modifiedList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.shoppingListsHeader,
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
        toolbarHeight: 90.0,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(child: Consumer(
              builder: (context, watch, child) {
                final shoppingLists =
                    watch(shoppingListRepositoryProvider.state).values.toList();

                return ShoppingLists(
                  shoppingLists: sortShoppingLists(shoppingLists),
                );
              },
            )),

            // TODO: Create common widget
            Builder(builder: (buttonContext) {
              return Container(
                margin: EdgeInsets.only(bottom: 16),
                child: CustomButton(
                    onTap: showNewShoppingListDialog,
                    icon: Icons.add,
                    label: AppLocalizations.of(context)!.newShoppingListLabel),
              );
            })
          ],
        ),
      ),
    );
  }
}
