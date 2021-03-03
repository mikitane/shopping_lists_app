import 'package:provider/provider.dart';
import 'package:shopping_lists_app/state/shopping_lists_state.dart';
import 'package:shopping_lists_app/models/product_model.dart';
import 'package:shopping_lists_app/models/shopping_list_model.dart';
import 'package:uuid/uuid.dart';

// TODO: Remove after testing
final initialShoppingLists = [
  ShoppingListModel(
    id: Uuid().v4(),
    name: 'Kauppalista',
    products: [
      ProductModel(name: 'Maito', amount: '1l', done: true),
      ProductModel(name: 'Maito', amount: '1l', done: true),
      ProductModel(name: 'Maito', amount: '1l', done: true),
      ProductModel(name: 'Maito', amount: '1l', done: false),
    ],
  ),
  ShoppingListModel(
    id: Uuid().v4(),
    name: 'Rautakauppalista',
    products: [],
  )
];

buildProviders() => [
  ChangeNotifierProvider(
    create: (context) =>
        ShoppingListsState(shoppingLists: initialShoppingLists),
  ),
];
