import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_lists_app/data/models/shopping_list/shopping_list_model.dart';
import 'package:shopping_lists_app/repositories/product_repository.dart';
import 'package:shopping_lists_app/screens/shopping_list_details_screen.dart';
import 'package:shopping_lists_app/providers.dart';
import 'package:shopping_lists_app/theme.dart'
    show defaultBorderRadius, secondaryTextColor, PrimaryColor;

class ShoppingListItem extends StatefulWidget {
  ShoppingListItem({required this.shoppingList, required this.onShoppingListTapped, required this.onShoppingListLongPress});

  final ShoppingListModel shoppingList;
  final void Function(ShoppingListModel) onShoppingListTapped;
  final void Function(ShoppingListModel) onShoppingListLongPress;

  @override
  _ShoppingListItemState createState() => _ShoppingListItemState();
}

class _ShoppingListItemState extends State<ShoppingListItem> {
  late ProductRepository productRepository;

  @override
  void initState() {
    super.initState();
    productRepository = context.read(productRepositoryProvider);
  }

  Text _buildProgressText(BuildContext context, int donePercentage) {
    return Text(
      '$donePercentage%',
      style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 12,
          fontWeight: FontWeight.w500),
    );
  }

  CircularPercentIndicator _buildProgressIndicator(
      BuildContext context, int donePercentage) {
    return CircularPercentIndicator(
      radius: 52,
      lineWidth: 6,
      percent: donePercentage / 100,
      center: donePercentage == 100
          ? Icon(Icons.done,
              color: Theme.of(context).colorScheme.secondary, size: 28)
          : _buildProgressText(context, donePercentage),
      progressColor: donePercentage == 100
          ? Theme.of(context).colorScheme.secondary
          : Theme.of(context).colorScheme.primary,
      backgroundColor: PrimaryColor.pc200,
      circularStrokeCap: CircularStrokeCap.round,
      startAngle: 180,
    );
  }

  Widget _buildDetailTexts(BuildContext context, int totalProductsCount) {
    String productCountLabel = totalProductsCount == 1
        ? AppLocalizations.of(context)!.shoppingListProductCountSingleText
        : AppLocalizations.of(context)!.shoppingListProductCountText;

    return Container(
      margin: EdgeInsets.only(left: 16),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TODO: This can be removed after Text elements are aligned correctly to center
            SizedBox(height: 3),
            Text(
              widget.shoppingList.name,
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w500, height: 1),
            ),
            SizedBox(height: 6),
            Text(
              '$totalProductsCount $productCountLabel',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, height: 1, color: secondaryTextColor),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      final products = widget.shoppingList.visibleProducts;

      int doneProductsCount =
          products.where((product) => product.done).length;
      int totalProductsCount = products.length;

      int donePercentage = totalProductsCount != 0
          ? (doneProductsCount * 100 / totalProductsCount).round()
          : 0;

      if (donePercentage == 100 && doneProductsCount != totalProductsCount) {
        donePercentage = 99;
      }
      return GestureDetector(
        onLongPress: () {
          widget.onShoppingListLongPress(widget.shoppingList);
        },
        onTap: () {
          widget.onShoppingListTapped(widget.shoppingList);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: defaultBorderRadius,
          ),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildProgressIndicator(context, donePercentage),
                _buildDetailTexts(context, totalProductsCount),
              ]),
        ),
      );
    });
  }
}
