// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {

  bool _darkTheme = false;
  bool _customTheme = false;
  late ThemeData _currentTheme;

  ThemeChanger(int theme) {
    switch(theme){
      case 1:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
      break;

      case 2:
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark();
      break;

      case 3:
        _darkTheme = false;
        _customTheme = true;
      break;

      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();

    }
  }

  bool get darkTheme => this._darkTheme;
  bool get customTheme => this._customTheme;
  ThemeData get currentTheme => this._currentTheme;

  set darkTheme(bool value) {
    this._darkTheme = value;
    this._customTheme = false;

    if (value) {
      _currentTheme = ThemeData.dark();
    } else {
      _currentTheme = ThemeData.light();
    }

    notifyListeners();
  }
  
  set customTheme(bool value) {
    this._customTheme = value;
    this._darkTheme = false;

    if (value) {
      _currentTheme = ThemeData.light();
    } else {
      _currentTheme = ThemeData.light();
    }

    notifyListeners();
  }


}