import 'package:flutter/material.dart';

// import 'dart:ui';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: isDarkTheme ? Colors.black : Colors.indigo[100],
      backgroundColor: isDarkTheme ? Colors.black : Colors.white,
      dialogBackgroundColor: isDarkTheme ? Colors.indigo[400] : Colors.white,
      // ignore: deprecated_member_use
      textSelectionColor: isDarkTheme ? Colors.indigo : Colors.white,
      textTheme: TextTheme(
        bodyText1: isDarkTheme
            ? TextStyle(color: Colors.white)
            : TextStyle(color: Colors.grey[700]),
        bodyText2: isDarkTheme
            ? TextStyle(color: Colors.indigo[400])
            : TextStyle(color: Colors.white),
      ),
      bottomAppBarColor: isDarkTheme ? Colors.pink[200] : Colors.pink[100],
      splashColor: isDarkTheme ? Colors.indigo[400] : Colors.grey[700],

      cardColor: isDarkTheme ? Colors.indigo : Colors.white,

      appBarTheme: AppBarTheme(
        elevation: 0.0,
        backgroundColor: isDarkTheme ? Colors.indigo : Colors.indigo,
      ),
    );
  }
}
