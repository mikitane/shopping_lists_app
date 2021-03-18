import 'package:flutter/material.dart';
import 'package:shopping_lists_app/data/models/product_model.dart';
import 'package:shopping_lists_app/repositories/product_repository.dart';
import 'package:shopping_lists_app/data/models/shopping_list_model.dart';
import 'package:shopping_lists_app/providers.dart';
import 'package:shopping_lists_app/selectors/shopping_list_selectors.dart';
import 'package:shopping_lists_app/widgets/common/custom_app_bar.dart';
import 'package:shopping_lists_app/widgets/new_product/new_product.dart';
import 'package:shopping_lists_app/widgets/product_list/product_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShoppingListDetailsScreenArguments {
  ShoppingListDetailsScreenArguments({required this.shoppingList});
  final ShoppingListModel shoppingList;
}

class ShoppingListDetailsScreen extends StatefulWidget {
  static const routeName = '/shoppingList';

  ShoppingListDetailsScreen(this.args);

  final ShoppingListDetailsScreenArguments args;

  @override
  _ShoppingListDetailsScreenState createState() => _ShoppingListDetailsScreenState();
}

class _ShoppingListDetailsScreenState extends State<ShoppingListDetailsScreen> {
  late ProductRepository productRepository;

  @override
  void initState() {
    super.initState();
    productRepository = context.read(productRepositoryProvider);
  }

  List<ProductModel> sortProducts(List<ProductModel> products) {
    final modifiedList = List<ProductModel>.from(products);
    modifiedList.sort((a, b) {
      if (a.done == b.done) return 0;
      if (a.done) return 1;
      return -1;
    });
    return modifiedList;
  }

  void onProductDone(ProductModel product) {
    product.done = !product.done;
    context
        .read(productRepositoryProvider)
        .saveProduct(product, widget.args.shoppingList.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.args.shoppingList.name),
      body: Column(
        children: [
          Expanded(
            child: Consumer(builder: (context, watch, child) {
              final shoppingList =
                  watch(singleShoppingListSelector(widget.args.shoppingList.id))!;
              final sortedProducts = sortProducts(shoppingList.products);

              return ProductList(
                  products: sortedProducts, onProductDone: onProductDone);
            }),
          ),
          NewProduct(shoppingListId: widget.args.shoppingList.id),
        ],
      ),
    );
  }
}
