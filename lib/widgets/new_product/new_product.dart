import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shopping_lists_app/theme.dart'
    show defaultBorderRadius, primaryColors;

class NewProduct extends StatefulWidget {
  @override
  _NewProductState createState() => _NewProductState();
}

// TODO: Maybe create a common Input element?
class _NewProductState extends State<NewProduct> {
  String productName = '';

  void handleNameInputChange(String value) {
    setState(() {
      productName = value;
    });
  }

  Widget _buildNameInput(BuildContext context) {
    return Expanded(
      child: Container(
        child: TextField(
          onChanged: handleNameInputChange,
          style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.onSurface),
          decoration: InputDecoration(
              hintStyle: TextStyle(color: primaryColors[700]),
              // contentPadding: EdgeInsets.symmetric(horizontal: 16),
              border: InputBorder.none,
              hintText:
                  AppLocalizations.of(context).productNameInputPlaceholder),
        ),
      ),
    );
  }

  Widget _buildAmountInput(BuildContext context) {
    return Container(
      width: 80,
      child: TextField(
        onChanged: handleNameInputChange,
        style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
        decoration: InputDecoration(
            hintStyle: TextStyle(color: primaryColors[700]),
            // contentPadding: EdgeInsets.symmetric(horizontal: 16),
            border: InputBorder.none,
            hintText:
                AppLocalizations.of(context).productAmountInputPlaceholder),
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
          SizedBox(
            height: 50,
            width: 50,
            child: ElevatedButton(
              onPressed: () => {},
              child: Icon(Icons.add,
                  color: Theme.of(context).colorScheme.onPrimary, size: 28),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
                elevation: MaterialStateProperty.all(0),
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: 0, horizontal: 0)),
              ),
            ),
          )
        ],
      ),
    );
  }
}