import 'package:flutter/material.dart';

ThemeData buildTheme(BuildContext context) => ThemeData(
      primaryColor: Color(0xFF61BCD9), // Colors.green[800],
      // accentColor: Colors.cyan[600],
      scaffoldBackgroundColor: Color(0xFFF6FCFE),
      cardColor: Colors.white,

      primaryTextTheme: Theme.of(context)
          .primaryTextTheme
          .apply(bodyColor: Colors.white, displayColor: Colors.white),

      textTheme: Theme.of(context)
          .primaryTextTheme
          .apply(bodyColor: Color(0xFF06374B), displayColor: Color(0xFF06374B)),



      // Define the default font family.
      // fontFamily: 'Roboto',

      // Define the default TextTheme. Use this to specify the default
      // text styling for headlines, titles, bodies of text, and more.
      // textTheme: TextTheme(
      //   headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      //   headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      //   bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      // ),
    );
