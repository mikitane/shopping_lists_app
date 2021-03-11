import 'package:flutter/material.dart';
import 'package:shopping_lists_app/models/shopping_list_model.dart';
import 'package:shopping_lists_app/repositories/shopping_list_repository.dart';
import 'package:shopping_lists_app/theme.dart';
import 'package:provider/provider.dart';

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
      context.read<ShoppingListRepository>().createShoppingList(ShoppingListModel(name: nameFieldController.text));
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: defaultBorderRadius),
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
                margin: EdgeInsets.only(left: 24, top: 24),
                child: Text(
                  'Uusi kauppalista',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: primaryColors[200],
                  borderRadius: defaultBorderRadius,
                ),
                child: TextField(
                  focusNode: nameFieldFocusNode,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (value) {
                    // createProduct();
                  },
                  controller: nameFieldController,
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.onSurface),
                  decoration: InputDecoration(
                      hintStyle: TextStyle(color: primaryColors[700]),
                      // contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      border: InputBorder.none,
                      hintText: 'Kauppalistan nimi'),
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.only(right: 12, bottom: 6),
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
                      borderRadius: BorderRadius.circular(10),
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
