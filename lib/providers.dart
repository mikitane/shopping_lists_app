import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_lists_app/repositories/product_repository.dart';
import 'package:shopping_lists_app/repositories/shopping_list_repository.dart';

final shoppingListRepositoryProvider =
    StateNotifierProvider((_) => ShoppingListRepository());
final productRepositoryProvider = StateNotifierProvider((ref) => ProductRepository(ref.read));
