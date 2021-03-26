import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shopping_lists_app/data/models/shopping_list/shopping_list_model.dart';
import 'package:shopping_lists_app/providers.dart';
import 'package:shopping_lists_app/screens/shopping_list_details_screen.dart';
import 'package:shopping_lists_app/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

class NewShoppingList extends StatefulWidget {
  @override
  _NewShoppingListState createState() => _NewShoppingListState();
}

class _NewShoppingListState extends State<NewShoppingList> {
  TextEditingController nameFieldController = TextEditingController();
  FocusNode? nameFieldFocusNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameFieldFocusNode = FocusNode();
    nameFieldFocusNode!.requestFocus();
  }

  @override
  void dispose() {
    nameFieldFocusNode!.dispose();
    super.dispose();
  }

  void createShoppingList() {
    if (nameFieldController.text.isNotEmpty) {
      final newShoppingList = ShoppingListModel(id: Uuid().v4(), name: nameFieldController.text, lastModified: DateTime.now());
      context.read(shoppingListRepositoryProvider).save(newShoppingList);

      final rootNavigator = Navigator.of(context, rootNavigator: true);
      rootNavigator.pop();
      rootNavigator.pushNamed(
        ShoppingListDetailsScreen.routeName,
        arguments:
            ShoppingListDetailsScreenArguments(shoppingList: newShoppingList),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: defaultBorderRadius),
      insetPadding: EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: defaultBorderRadius,
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(left: 24),
                height: 64,
                alignment: Alignment.centerLeft,
                child: Text(
                  AppLocalizations.of(context)!.newShoppingListDialogHeader,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 24, left: 24, right: 24),
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: PrimaryColor.pc200,
                  borderRadius: defaultBorderRadius,
                ),
                child: TextField(
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.sentences,
                  focusNode: nameFieldFocusNode,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (value) {
                    // createProduct();
                  },
                  controller: nameFieldController,
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.onSurface),
                  decoration: InputDecoration(
                      hintStyle: TextStyle(color: PrimaryColor.pc700),
                      // contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      border: InputBorder.none,
                      hintText: AppLocalizations.of(context)!.newShoppingListInputPlaceholder),
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.only(right: 8, bottom: 4),
                child: ElevatedButton(
                  onPressed: () => {createShoppingList()},
                  child: Text('Luo',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.primary)),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: defaultBorderRadius,
                    )),
                    elevation: MaterialStateProperty.all(0),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 12, horizontal: 20)),
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
