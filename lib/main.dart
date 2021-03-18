import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_lists_app/data/hive.dart';
import 'package:shopping_lists_app/routes.dart';
import 'package:shopping_lists_app/data/l10n/localization.dart';
import 'package:shopping_lists_app/theme.dart';
import 'package:shopping_lists_app/screens/shopping_lists_screen.dart';

void main() async {
  await initHive();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {

    return ProviderScope(
      child: MaterialApp(
        title: 'Shopping Lists App',
        initialRoute: ShoppingListsScreen.routeName,
        onGenerateRoute: generateRoutes,
        theme: buildTheme(context),
        localizationsDelegates: buildLocalizationsDelegates(),
        supportedLocales: buildSupportedLocales(),
      ),
    );
  }
}
