import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_lists_app/data/models/product/product_model.dart';
import 'package:shopping_lists_app/providers.dart';
import 'package:shopping_lists_app/theme.dart'
    show defaultBorderRadius, primaryColors;
import 'package:shopping_lists_app/widgets/common/custom_button.dart';

class ProductListItem extends StatelessWidget {
  ProductListItem(
      {required this.product, required this.onProductDone, required Key key})
      : super(key: key);

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
        CustomButton(
          onTap: () {
            onProductDone(product);
          },
          icon: Icons.check,
          kind: product.done ? ButtonKind.primary : ButtonKind.secondary,
        )
      ],
    );
  }
}
