import 'package:flutter/material.dart';

class DarkThemeProvider with ChangeNotifier {
  bool _darkTheme = false;
  bool get darkTheme => _darkTheme;
  set darkTheme(bool value) {
    _darkTheme = value;
    notifyListeners();
  }
}
