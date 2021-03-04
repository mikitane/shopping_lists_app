import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shopping_lists_app/repositories/product_repository.dart';
import 'package:shopping_lists_app/repositories/shopping_list_repository.dart';
import 'package:shopping_lists_app/widgets/common/custom_app_bar.dart';
import 'package:shopping_lists_app/widgets/shopping_lists/shopping_lists.dart';

class ShoppingListsScreen extends StatefulWidget {
  static const routeName = '/shoppingLists';

  @override
  _ShoppingListsScreenState createState() => _ShoppingListsScreenState();
}

class _ShoppingListsScreenState extends State<ShoppingListsScreen> {
  ShoppingListRepository shoppingListRepository;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    shoppingListRepository = context.read<ShoppingListRepository>();
  }

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
            Expanded(
                child: StreamBuilder(
              initialData: shoppingListRepository.shoppingLists,
              builder: (context, snapshot) {
                return ShoppingLists(
                  shoppingLists: snapshot.data,
                );
              },
            )),

            // TODO: Create common widget
            Builder(builder: (buttonContext) {
              return Container(
                margin: EdgeInsets.only(bottom: 16),
                child: ElevatedButton.icon(
                  onPressed: () => { Scaffold.of(buttonContext).showSnackBar(SnackBar(content: Text('Tulossa pian: Listojen luonti!'),)) },
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
              );
            })
          ],
        ),
      ),
    );
  }
}
