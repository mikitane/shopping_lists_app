import 'package:flutter/material.dart';
import 'package:shopping_lists_app/data/models/product/product_model.dart';
import 'package:shopping_lists_app/widgets/product_list/product_list_item.dart';

class ProductList extends StatelessWidget {
  ProductList({required this.products, required this.onProductDone, this.padding = const EdgeInsets.all(12)});

  final List<ProductModel> products;
  final EdgeInsets padding;
  final void Function(ProductModel) onProductDone;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: padding,
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductListItem(
          onProductDone: onProductDone,
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
