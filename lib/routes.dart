import 'package:flutter/material.dart';
import 'package:shopping_lists_app/screens/shopping_list_details_screen.dart';
import 'package:shopping_lists_app/screens/shopping_lists_screen.dart';

Route<dynamic> generateRoutes(RouteSettings settings) {
  final routes = <String, WidgetBuilder>{
    ShoppingListsScreen.routeName: (context) => ShoppingListsScreen(),
    ShoppingListDetailsScreen.routeName: (context) => ShoppingListDetailsScreen(
        settings.arguments as ShoppingListDetailsScreenArguments),
  };

  WidgetBuilder builder = routes[settings.name]!;

  return MaterialPageRoute(builder: (ctx) => builder(ctx));
}
