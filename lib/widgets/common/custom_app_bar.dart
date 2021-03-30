import 'package:flutter/material.dart';
import 'package:shopping_lists_app/theme.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    required title,
    centerTitle,
    leading,
    toolbarHeight = 64.0,
    fontSize = 20.0,
    fontWeight = FontWeight.w600,
    color,
    automaticallyImplyLeading = true,
  }) : super(
            title: Text(title,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  color: color,
                )),
            centerTitle: centerTitle,
            leading: leading,
            toolbarHeight: toolbarHeight,
            automaticallyImplyLeading: automaticallyImplyLeading,
            iconTheme: IconThemeData(color: color ?? PrimaryColor.pc500));
}
