import 'package:provider/provider.dart';
import 'package:shopping_lists_app/repositories/product_repository.dart';
import 'package:shopping_lists_app/repositories/shopping_list_repository.dart';

buildProviders() => [
  Provider(create: (_) => ShoppingListRepository(),),
  Provider(create: (_) => ProductRepository(),),
];
