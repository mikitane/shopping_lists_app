import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shopping_lists_app/data/models/product/product_model.dart';
import 'package:shopping_lists_app/data/models/shopping_list/shopping_list_model.dart';

// Workaround for overridable static properties which are missing from Dart.
const modelBoxMapping = {
  ShoppingListModel: 'shoppingLists',
  ProductModel: 'products',
};

Future<void> initHive() async {
  await Hive.initFlutter();

  Hive.registerAdapter(ShoppingListModelAdapter());
  Hive.registerAdapter(ProductModelAdapter());

  await Hive.openBox<ShoppingListModel>(modelBoxMapping[ShoppingListModel]!);
  await Hive.openBox<ProductModel>(modelBoxMapping[ProductModel]!);
}
