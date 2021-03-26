import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shopping_lists_app/data/models/product/product_model.dart';
import 'package:shopping_lists_app/providers.dart';
import 'package:shopping_lists_app/theme.dart'
    show defaultBorderRadius, primaryColors;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_lists_app/widgets/common/custom_button.dart';
import 'package:uuid/uuid.dart';

class NewProduct extends StatefulWidget {
  NewProduct({required this.shoppingListId});

  final String shoppingListId;

  @override
  _NewProductState createState() => _NewProductState();
}

// TODO: Maybe create a common Input element?
class _NewProductState extends State<NewProduct> {
  TextEditingController nameFieldController = TextEditingController();
  TextEditingController amountFieldController = TextEditingController();
  FocusNode? nameFieldFocusNode;

  @override
  void initState() {
    super.initState();
    nameFieldFocusNode = FocusNode();
  }

  @override
  void dispose() {
    nameFieldFocusNode!.dispose();
    super.dispose();
  }

  void createProduct() {
    if (nameFieldController.text.isNotEmpty) {
      final newProduct = ProductModel(
          id: Uuid().v4(),
          name: nameFieldController.text,
          amount: amountFieldController.text,
          done: false);

      context
          .read(productRepositoryProvider)
          .saveProduct(newProduct, widget.shoppingListId);

      nameFieldFocusNode!.requestFocus();
    }

    nameFieldController.text = '';
    amountFieldController.text = '';
  }

  Widget _buildNameInput(BuildContext context) {
    return Expanded(
      child: Container(
        child: TextField(
          textInputAction: TextInputAction.next,
          focusNode: nameFieldFocusNode,
          controller: nameFieldController,
          style: TextStyle(
              fontSize: 16, color: Theme.of(context).colorScheme.onSurface),
          decoration: InputDecoration(
              hintStyle: TextStyle(color: primaryColors[700]),
              // contentPadding: EdgeInsets.symmetric(horizontal: 16),
              border: InputBorder.none,
              hintText:
                  AppLocalizations.of(context)!.productNameInputPlaceholder),
        ),
      ),
    );
  }

  Widget _buildAmountInput(BuildContext context) {
    return Container(
      width: 80,
      child: TextField(
        textInputAction: TextInputAction.done,
        onSubmitted: (value) {
          createProduct();
        },
        controller: amountFieldController,
        style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
        decoration: InputDecoration(
            hintStyle: TextStyle(color: primaryColors[700]),
            // contentPadding: EdgeInsets.symmetric(horizontal: 16),
            border: InputBorder.none,
            hintText:
                AppLocalizations.of(context)!.productAmountInputPlaceholder),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: double.infinity,
      width: 1,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(color: primaryColors[700]),
    );
  }

  // TODO: Clean up
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: primaryColors[200],
                borderRadius: defaultBorderRadius,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildNameInput(context),
                  _buildDivider(),
                  _buildAmountInput(context),
                ],
              ),
            ),
          ),
          SizedBox(width: 16),
          CustomButton(
            onTap: createProduct,
            icon: Icons.add,
          ),
        ],
      ),
    );
  }
}
