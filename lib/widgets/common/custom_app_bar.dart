import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    required title,
    toolbarHeight = 64.0,
    fontSize = 20.0,
    fontWeight = FontWeight.w600,
  }) : super(
          title: Text(title,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: fontWeight,
              )),
          toolbarHeight: toolbarHeight,
        );
}
