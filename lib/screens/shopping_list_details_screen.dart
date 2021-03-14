import 'package:flutter/material.dart';
import 'package:shopping_lists_app/data/models/product_model.dart';
import 'package:shopping_lists_app/repositories/product_repository.dart';
import 'package:shopping_lists_app/data/models/shopping_list_model.dart';
import 'package:shopping_lists_app/providers.dart';
import 'package:shopping_lists_app/widgets/common/custom_app_bar.dart';
import 'package:shopping_lists_app/widgets/new_product/new_product.dart';
import 'package:shopping_lists_app/widgets/product_list/product_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShoppingListDetailsScreenArguments {
  ShoppingListDetailsScreenArguments({required this.shoppingList});
  final ShoppingListModel shoppingList;
}

class ShoppingListScreen extends StatefulWidget {
  static const routeName = '/shoppingList';

  @override
  _ShoppingListScreenState createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  late ProductRepository productRepository;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productRepository = context.read(productRepositoryProvider);
  }

  List<ProductModel> sortAndFilterProducts(
      List<ProductModel> products, String shoppingListId) {
    final modifiedList = products
        .where((element) => element.shoppingListId == shoppingListId)
        .toList();
    modifiedList.sort((a, b) {
      if (a.done == b.done) return 0;
      if (a.done) return 1;
      return -1;
    });
    return modifiedList;
  }

  @override
  Widget build(BuildContext context) {
    final ShoppingListDetailsScreenArguments args = ModalRoute.of(context)!
        .settings
        .arguments as ShoppingListDetailsScreenArguments;

    return Scaffold(
      appBar: CustomAppBar(title: args.shoppingList.name),
      body: Column(
        children: [
          Expanded(
            child: Consumer(builder: (context, watch, child) {
              final productList = watch(productRepositoryProvider.state);
              final sortedAndFilteredProducts =
                  sortAndFilterProducts(productList, args.shoppingList.id);

              return ProductList(products: sortedAndFilteredProducts);
            }),
          ),
          NewProduct(shoppingListId: args.shoppingList.id),
        ],
      ),
    );
  }
}
