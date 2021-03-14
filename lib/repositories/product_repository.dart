import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_lists_app/data/models/product_model.dart';
import 'package:shopping_lists_app/providers.dart';
import 'package:shopping_lists_app/repositories/model_repository.dart';

class ProductRepository extends ModelRepository<ProductModel> {
  ProductRepository(this.read);

  final Reader read;

  @override
  void save(ProductModel product) {
    super.save(product);

    final shoppingListRepo = read(shoppingListRepositoryProvider);
    final shoppingList = shoppingListRepo.get(product.shoppingListId)!
      ..lastModified = DateTime.now();

    shoppingListRepo.save(shoppingList);
  }
}
