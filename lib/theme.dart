import 'package:flutter/material.dart';

Map<int, Color> primaryColors = {
  // 50:  const Color(0xFFFFFAF5),
  // 100: const Color(0xFFFEF5EB),
  200: const Color(0xFFFEEBD8),
  // 300: const Color(0xFFFCDDC0),
  // 400: const Color(0xFFF8C9A0),
  500: const Color(0xFFF4B480),
  // 600: const Color(0xFFEEA36D),
  700: const Color(0xFFE7965F),
  // 800: const Color(0xFFC87846),
  // 900: const Color(0xFF965027),
};

Map<int, Color> secondaryColors = {
  500: const Color(0xFF80C0F4),
  700: const Color(0xFF4DA5E0),
};

// ColorScheme or ThemeData do not have this color property
Color onDisabledColor = Color(0xFFCFC6BF);

ColorScheme colorScheme = ColorScheme(
  primary: primaryColors[500],
  primaryVariant: primaryColors[700],
  secondary: secondaryColors[500],
  secondaryVariant: secondaryColors[700],
  surface: Colors.white,
  background: const Color(0xFFF8F5F2),
  error: const Color(0xFFF88C8C),
  onPrimary: const Color(0xFF773309),
  onSecondary: const Color(0xFF094D77),
  onSurface: const Color(0xFF301203),
  onBackground: const Color(0xFF301203),
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
