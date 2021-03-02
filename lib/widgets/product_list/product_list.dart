import 'package:flutter/material.dart';
import 'package:shopping_lists_app/models/product_model.dart';
import 'package:shopping_lists_app/widgets/product_list/product_list_item.dart';

class ProductList extends StatelessWidget {
  ProductList({this.products, this.padding = const EdgeInsets.all(12)});

  final List<ProductModel> products;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: padding,
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductListItem(product: products[index],);
      },
      separatorBuilder: (BuildContext context, int index) => Container(
        width: double.infinity,
        height: 12,
      ),
    );
  }
}