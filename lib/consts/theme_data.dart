import 'package:flutter/material.dart';

// import 'dart:ui';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: isDarkTheme ? Colors.black : Colors.pink[50],
      backgroundColor: isDarkTheme ? Colors.black : Colors.white,
      textSelectionColor: isDarkTheme ? Colors.white : Colors.black,
      bottomAppBarColor: isDarkTheme ? Colors.pink[200] : Colors.pink[100],
      splashColor: isDarkTheme ? Colors.white : Colors.indigo[400],
      // appBarTheme: AppBarTheme(
      //   elevation: 0.0,
      //   color: isDarkTheme ? Colors.white : Colors.indigo[400],
      //   backgroundColor: isDarkTheme ? Colors.pink[200] : Colors.black,
      // ),
    );
  }
}
