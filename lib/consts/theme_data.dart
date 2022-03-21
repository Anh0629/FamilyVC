import 'package:flutter/material.dart';

// import 'dart:ui';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: isDarkTheme ? Colors.black : Colors.indigo[100],
      backgroundColor: isDarkTheme ? Colors.black : Colors.white,
      primaryColorLight: isDarkTheme ? Colors.indigo[400] : HexColor("FDA65D"),
      //FFDFAF cam nhat
      indicatorColor: isDarkTheme ? Colors.indigo : HexColor("FFDFAF"),

      
      dialogBackgroundColor: isDarkTheme ? Colors.indigo[400] : Colors.white,
      // ignore: deprecated_member_use
      textSelectionColor: isDarkTheme ? Colors.indigo : HexColor("FF8243"),
      // ignore: deprecated_member_use
      buttonColor: isDarkTheme ? Colors.indigo : HexColor("FF8243"),

      textTheme: TextTheme(
        bodyText1: isDarkTheme
            ? TextStyle(color: Colors.white)
            : TextStyle(color: Colors.indigo),
      ),
      bottomAppBarColor: isDarkTheme ? Colors.pink[200] : Colors.pink[100],
      splashColor: isDarkTheme ? Colors.black : Colors.indigo[400],

      cardColor: isDarkTheme ? Colors.indigo : Colors.white,

      appBarTheme: AppBarTheme(
        elevation: 0.0,
        backgroundColor: isDarkTheme ? Colors.indigo[400] : HexColor("FF8243"),
      ),
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
