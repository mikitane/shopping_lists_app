import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_lists_app/data/models/product/product_model.dart';
import 'package:shopping_lists_app/providers.dart';
import 'package:shopping_lists_app/repositories/model_repository.dart';
import 'package:shopping_lists_app/selectors/shopping_list_selectors.dart';

class ProductRepository {
  ProductRepository(this.read);

  final Reader read;

  void saveProduct(ProductModel product, String shoppingListId) {
    final shoppingList = read(singleShoppingListSelector(shoppingListId))!;
    final productIndex = shoppingList.products.indexWhere((oldProduct) => oldProduct.id == product.id);

    final modifiedProducts = List<ProductModel>.from(shoppingList.products);

    if (productIndex == -1) {
      // Create
      modifiedProducts.add(product);
    } else {
      // Update
      modifiedProducts[productIndex] = product;
    }
    final modifiedShoppingList = shoppingList.copyWith(products: modifiedProducts, lastModified: DateTime.now());

    read(shoppingListRepositoryProvider).save(modifiedShoppingList);
  }
}
