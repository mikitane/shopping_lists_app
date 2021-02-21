import 'package:flutter/material.dart';
import 'package:shopping_lists_app/routes.dart';
import 'package:shopping_lists_app/l10n/localization.dart';
import 'package:shopping_lists_app/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Lists App',
      routes: routes,
      theme: buildTheme(context),
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
    );
  }
}
