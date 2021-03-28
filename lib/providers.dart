import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_lists_app/data/api/sync_controller.dart';
import 'package:shopping_lists_app/repositories/product_repository.dart';
import 'package:shopping_lists_app/repositories/shopping_list_repository.dart';
import 'package:shopping_lists_app/repositories/sync_state_repository.dart';

final shoppingListRepositoryProvider =
    StateNotifierProvider((_) => ShoppingListRepository());

final productRepositoryProvider =
    Provider((ref) => ProductRepository(ref.read));

final syncControllerProvider = Provider((ref) => SyncController(read: ref.read));

final syncStateRepositoryProvider = StateNotifierProvider((_) => SyncStateRepository());