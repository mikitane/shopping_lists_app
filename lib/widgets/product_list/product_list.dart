import 'package:flutter/material.dart';
import 'package:shopping_lists_app/data/models/product/product_model.dart';
import 'package:shopping_lists_app/widgets/product_list/product_list_item.dart';

enum ProductListMode { normal, delete }

class ProductList extends StatefulWidget {
  ProductList({
    required this.products,
    required this.onProductDone,
    required this.onItemLongPress,
    required this.onProductRemove,
    required this.mode,
    this.padding = const EdgeInsets.all(12),
  });

  final List<ProductModel> products;
  final EdgeInsets padding;
  final void Function(ProductModel) onProductDone;
  final void Function() onItemLongPress;
  final void Function(ProductModel) onProductRemove;
  final ProductListMode mode;

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: widget.padding,
      itemCount: widget.products.length,
      itemBuilder: (context, index) {
        return ProductListItem(
          onProductDone: widget.onProductDone,
          onProductRemove: widget.onProductRemove,
          onLongPress: widget.onItemLongPress,
          product: widget.products[index],
          mode: widget.mode,
          key: Key(widget.products[index].id.toString()),
        );
      },
      separatorBuilder: (BuildContext context, int index) => Container(
        width: double.infinity,
        height: 12,
      ),
    );
  }
}
