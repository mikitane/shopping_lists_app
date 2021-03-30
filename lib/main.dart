import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_lists_app/data/hive.dart';
import 'package:shopping_lists_app/routes.dart';
import 'package:shopping_lists_app/data/l10n/localization.dart';
import 'package:shopping_lists_app/theme.dart';
import 'package:shopping_lists_app/screens/shopping_lists_screen.dart';
import 'package:shopping_lists_app/widgets/sync_widget/sync_widget.dart';

void main() async {
  await initHive();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: SyncWidget(
        child: MaterialApp(
          title: 'Shopping Lists App',
          initialRoute: ShoppingListsScreen.routeName,
          onGenerateRoute: generateRoutes,
          theme: buildTheme(context),
          localizationsDelegates: buildLocalizationsDelegates(),
          supportedLocales: buildSupportedLocales(),
        ),
      ),
    );
  }
}
