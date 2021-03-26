import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shopping_lists_app/data/models/product/product_model.dart';
import 'package:shopping_lists_app/repositories/product_repository.dart';
import 'package:shopping_lists_app/data/models/shopping_list/shopping_list_model.dart';
import 'package:shopping_lists_app/providers.dart';
import 'package:shopping_lists_app/selectors/shopping_list_selectors.dart';
import 'package:shopping_lists_app/theme.dart';
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
  _ShoppingListDetailsScreenState createState() =>
      _ShoppingListDetailsScreenState();
}

class _ShoppingListDetailsScreenState extends State<ShoppingListDetailsScreen> {
  late ProductRepository productRepository;
  ProductListMode mode = ProductListMode.normal;

  @override
  void initState() {
    super.initState();
    productRepository = context.read(productRepositoryProvider);
  }

  void setMode(ProductListMode newMode) {
    setState(() {
      mode = newMode;
    });
  }

  Future<bool> _onWillPop() async {
    if (mode == ProductListMode.delete) {
      setMode(ProductListMode.normal);
      return false;
    }

    return true;
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
    final modifiedProduct = product.copyWith(done: !product.done);
    context
        .read(productRepositoryProvider)
        .saveProduct(modifiedProduct, widget.args.shoppingList.id);
  }

  void onProductRemove(ProductModel product) {
    final shoppingListRepoProvider = context.read(shoppingListRepositoryProvider);
    final shoppingList = shoppingListRepoProvider.getEntity(widget.args.shoppingList.id)!;

    // TODO: Check that the product to be removed is really the last product.
    if (shoppingList.visibleProducts.length == 1) {
      setMode(ProductListMode.normal);
    }

    final modifiedProduct = product.copyWith(removed: true);
    context
        .read(productRepositoryProvider)
        .saveProduct(modifiedProduct, widget.args.shoppingList.id);
  }

  @override
  Widget build(BuildContext context) {
    final isNormalMode = mode == ProductListMode.normal;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: CustomAppBar(
          title: isNormalMode
              ? widget.args.shoppingList.name
              : AppLocalizations.of(context)!.removeProductsHeader,
          color: isNormalMode ? null : colorScheme.error,
          automaticallyImplyLeading: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: Consumer(builder: (context, watch, child) {
                final shoppingList = watch(
                    singleShoppingListSelector(widget.args.shoppingList.id))!;
                final sortedProducts = sortProducts(shoppingList.visibleProducts);

                return ProductList(
                  products: sortedProducts,
                  onProductDone: onProductDone,
                  onProductRemove: onProductRemove,
                  mode: mode,
                  onItemLongPress: () {
                    setMode(ProductListMode.delete);
                  },
                );
              }),
            ),
            if (isNormalMode)
              NewProduct(shoppingListId: widget.args.shoppingList.id),
          ],
        ),
      ),
    );
  }
}
