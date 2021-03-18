import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_lists_app/data/models/product_model.dart';
import 'package:shopping_lists_app/providers.dart';
import 'package:shopping_lists_app/repositories/model_repository.dart';
import 'package:shopping_lists_app/selectors/shopping_list_selectors.dart';

class ProductRepository {
  ProductRepository(this.read);

  final Reader read;

  void saveProduct(ProductModel product, String shoppingListId) {
    final shoppingList = read(singleShoppingListSelector(shoppingListId))!;
    final modifiedProducts = List<ProductModel>.from(shoppingList.products);
    final productIndex = modifiedProducts.indexWhere((oldProduct) => oldProduct.id == product.id);

    if (productIndex == -1) {
      // Create
      modifiedProducts.add(product);
    } else {
      // Update
      modifiedProducts[productIndex] = product;
    }

    shoppingList.products = modifiedProducts;
    shoppingList.lastModified = DateTime.now();

    read(shoppingListRepositoryProvider).save(shoppingList);
  }
}
