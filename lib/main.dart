import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_lists_app/global_state/providers.dart';
import 'package:shopping_lists_app/global_state/shopping_lists_state.dart';
import 'package:shopping_lists_app/routes.dart';
import 'package:shopping_lists_app/l10n/localization.dart';
import 'package:shopping_lists_app/theme.dart';
import 'package:shopping_lists_app/widgets/shopping_lists_screen/shopping_lists_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Shopping Lists App',
        initialRoute: ShoppingListsScreen.routeName,
        routes: routes,
        theme: buildTheme(context),
        localizationsDelegates: localizationsDelegates,
        supportedLocales: supportedLocales,
      ),
    );
  }
}
