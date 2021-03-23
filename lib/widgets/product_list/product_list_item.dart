import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_lists_app/data/models/product/product_model.dart';
import 'package:shopping_lists_app/providers.dart';
import 'package:shopping_lists_app/theme.dart'
    show defaultBorderRadius, primaryColors;

class ProductListItem extends StatelessWidget {
  ProductListItem({required this.product, required this.onProductDone, required Key key}) : super(key: key);

  final ProductModel product;
  final void Function(ProductModel) onProductDone;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: defaultBorderRadius),
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text(
                  product.amount ?? '',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 16),

        // TODO: Create common widget
        SizedBox(
          height: 50,
          width: 50,
          child: ElevatedButton(
            onPressed: () {
              onProductDone(product);
            },
            child: Icon(Icons.check,
                color:
                    product.done ? colorScheme.onPrimary : primaryColors[700],
                size: 28),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  product.done ? colorScheme.primary : primaryColors[200]),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: defaultBorderRadius,
              )),
              elevation: MaterialStateProperty.all(0),
              padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(vertical: 0, horizontal: 0)),
            ),
          ),
        ),
      ],
    );
  }
}
