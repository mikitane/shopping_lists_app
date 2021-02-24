import 'package:flutter/material.dart';
import 'package:shopping_lists_app/models/product_model.dart';
import 'package:shopping_lists_app/widgets/product_list/product_list_item.dart';

class ProductList extends StatelessWidget {
  ProductList({this.products});

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
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