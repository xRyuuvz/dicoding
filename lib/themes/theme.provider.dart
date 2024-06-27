// ignore_for_file: recursive_getters
import 'package:flutter/material.dart';
import 'package:kantinwisaga1/themes/dark.mode.dart';
import 'package:kantinwisaga1/themes/light.mode.dart';


class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toogleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
