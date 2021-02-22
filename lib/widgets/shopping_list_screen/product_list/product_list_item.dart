import 'package:flutter/material.dart';
import 'package:shopping_lists_app/models/product_model.dart';

class ProductListItem extends StatelessWidget {
  ProductListItem({this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              product.name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              product.done ? 'Done' : 'Not done',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: product.done
                    ? Theme.of(context).primaryColor
                    : Colors.grey[200],
              ),
            )
          ],
        ),
      ),
    );
  }
}
