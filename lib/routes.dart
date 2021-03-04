import 'package:shopping_lists_app/screens/shopping_list_details_screen.dart';
import 'package:shopping_lists_app/screens/shopping_lists_screen.dart';

buildRoutes() => {
  ShoppingListsScreen.routeName: (context) => ShoppingListsScreen(),
  ShoppingListScreen.routeName: (context) => ShoppingListScreen()
};