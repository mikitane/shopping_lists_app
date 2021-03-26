import 'package:flutter/material.dart';
import 'package:shopping_lists_app/data/models/product/product_model.dart';
import 'package:shopping_lists_app/theme.dart'
    show defaultBorderRadius, secondaryTextColor;
import 'package:shopping_lists_app/widgets/common/custom_button.dart';
import 'package:shopping_lists_app/widgets/product_list/product_list.dart';

class ProductListItem extends StatelessWidget {
  ProductListItem(
      {required this.product,
      required this.onProductDone,
      required this.onLongPress,
      required this.onProductRemove,
      required this.mode,
      required Key key})
      : super(key: key);

  final ProductModel product;
  final void Function(ProductModel) onProductDone;
  final void Function() onLongPress;
  final void Function(ProductModel) onProductRemove;
  final ProductListMode mode;

  Widget _buildDetailsWidget(context) {
    return Expanded(
      child: GestureDetector(
        onLongPress: onLongPress,
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
                  fontSize: 14,
                  color: secondaryTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDoneButton() {
    return CustomButton(
      onTap: () {
        onProductDone(product);
      },
      icon: Icons.check,
      kind: product.done ? ButtonKind.primary : ButtonKind.secondary,
    );
  }

    Widget _buildDeleteButton() {
    return CustomButton(
      onTap: () {
        onProductRemove(product);
      },
      icon: Icons.clear,
      kind: ButtonKind.error,
    );
  }



  @override
  Widget build(BuildContext context) {
    print(mode);
    return Row(
      children: [
        _buildDetailsWidget(context),
        SizedBox(width: 16),
        mode == ProductListMode.normal ? _buildDoneButton() : _buildDeleteButton()
      ],
    );
  }
}
