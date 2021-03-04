import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shopping_lists_app/models/product_model.dart';
import 'package:shopping_lists_app/repositories/product_repository.dart';
import 'package:shopping_lists_app/state/shopping_lists_state.dart';
import 'package:shopping_lists_app/models/shopping_list_model.dart';
import 'package:shopping_lists_app/widgets/common/custom_app_bar.dart';
import 'package:shopping_lists_app/widgets/new_product/new_product.dart';
import 'package:shopping_lists_app/widgets/product_list/product_list.dart';

class ShoppingListDetailsScreenArguments {
  ShoppingListDetailsScreenArguments({this.shoppingListId});
  final String shoppingListId;
}

class ShoppingListScreen extends StatefulWidget {
  static const routeName = '/shoppingList';

  @override
  _ShoppingListScreenState createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  Stream<List<ProductModel>> productsStream;
  ProductRepository productRepository;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productRepository = context.read<ProductRepository>();
  }

  List<ProductModel> sortAndFilterProducts(
      List<ProductModel> products, String shoppingListId) {
    final modifiedList =
        products.where((element) => element.shoppingListId == shoppingListId).toList();
    modifiedList.sort((a, b) {
      if (a.done == b.done) return 0;
      if (a.done) return 1;
      return -1;
    });
    return modifiedList;
  }

  @override
  Widget build(BuildContext context) {
    final ShoppingListDetailsScreenArguments args =
        ModalRoute.of(context).settings.arguments;

    // FIXME: Do not initialize stream in build method. Get stream from db
    if (productsStream == null) {
      productsStream = context.read<ProductRepository>().getProductsStream();
    }

    return Scaffold(
      appBar:
          CustomAppBar(title: AppLocalizations.of(context).shoppingListHeader),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
                initialData: sortAndFilterProducts(
                        productRepository.products, args.shoppingListId) ??
                    [],
                stream: productsStream,
                builder: (context, AsyncSnapshot<List<ProductModel>> snapshot) {
                  return ProductList(
                      products: sortAndFilterProducts(
                          snapshot.data, args.shoppingListId));
                }),
          ),
          NewProduct(shoppingListId: args.shoppingListId),
        ],
      ),
    );
  }
}
