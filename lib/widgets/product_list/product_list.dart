import 'package:flutter/material.dart';
import 'package:shopping_lists_app/models/product_model.dart';
import 'package:shopping_lists_app/widgets/product_list/product_list_item.dart';

class ProductList extends StatelessWidget {
  ProductList({this.products,   this.padding = const EdgeInsets.all(12)});

  final List<ProductModel> products;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   decoration: BoxDecoration(color: Colors.red),
    //   child: AnimatedList(
    //       initialItemCount: products.length,
    //       itemBuilder: (BuildContext context, int index, animation) {
    //         return SlideTransition(
    //           position: Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
    //               .animate(animation),
    //           child: ProductListItem(
    //             product: products[index],
    //           ),
    //         );
    //       }),
    // );

    return ListView.separated(
      padding: padding,
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductListItem(
          product: products[index],
          key: Key(products[index].id.toString()),
        );
      },
      separatorBuilder: (BuildContext context, int index) => Container(
        width: double.infinity,
        height: 12,
      ),
    );
  }
}
