import 'package:flutter/material.dart';

abstract class PrimaryColor {
  // static const pc50 = Color(0xFFFFFAF5);
  // static const pc100 = Color(0xFFFEF5EB);
  static const pc200 = Color(0xFFFEEBD8);
  // static const pc300 = Color(0xFFFCDDC0);
  // static const pc400 = Color(0xFFF8C9A0);
  static const pc500 = Color(0xFFF4B480);
  // static const pc600 = Color(0xFFEEA36D);
  static const pc700 = Color(0xFFE7965F);
  // static const pc800 = Color(0xFFC87846);
  // static const pc900 = Color(0xFF965027);
}

abstract class SecondaryColor {
  static const sc500 = Color(0xFF80C0F4);
  static const sc700 = Color(0xFF4DA5E0);
}

Color secondaryTextColor = Color(0xFF867D79);

// ColorScheme or ThemeData do not have this color property
Color onDisabledColor = Color(0xFFCFC6BF);

ColorScheme colorScheme = ColorScheme(
  primary: PrimaryColor.pc500,
  primaryVariant: PrimaryColor.pc700,
  secondary: SecondaryColor.sc500,
  secondaryVariant: SecondaryColor.sc700,
  surface: Colors.white,
  background: const Color(0xFFF8F5F2),
  error: const Color(0xFFF48080),
  onPrimary: const Color(0xFF965027),
  onSecondary: const Color(0xFF094D77),
  onSurface: const Color(0xFF46362F),
  onBackground: const Color(0xFF46362F),
  onError: const Color(0xFF6E0707),
  brightness: Brightness.light,
);

const String fontFamily = 'Poppins';
const BorderRadius defaultBorderRadius =  const BorderRadius.all(Radius.circular(10));

ThemeData buildTheme(BuildContext context) => ThemeData(
      fontFamily: fontFamily,
      colorScheme: colorScheme,
      primaryColor: colorScheme.primary,
      accentColor: colorScheme.secondary,
      scaffoldBackgroundColor: colorScheme.background,
      cardColor: colorScheme.surface,
      canvasColor: colorScheme.surface,
      disabledColor: Color(0xFFEAE5E1),

      appBarTheme: AppBarTheme(
          brightness: Brightness.light,
          color: Colors.transparent,
          elevation: 0,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: colorScheme.primary,
                displayColor: colorScheme.primary,
                fontFamily: fontFamily,
              ),
          iconTheme: IconThemeData(
            color: colorScheme.primary,
          )),

      primaryTextTheme: Theme.of(context).primaryTextTheme.apply(
            bodyColor: colorScheme.onPrimary,
            displayColor: colorScheme.onPrimary,
            fontFamily: fontFamily,
          ),

      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: colorScheme.onBackground,
            displayColor: colorScheme.onBackground,
            fontFamily: fontFamily,
          ),

      // Define the default TextTheme. Use this to specify the default
      // text styling for headlines, titles, bodies of text, and more.
      // textTheme: TextTheme(
      //   headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      //   headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      //   bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      // ),
    );
