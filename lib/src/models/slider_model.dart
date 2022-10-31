// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';

class SliderModel with ChangeNotifier {
  late double _currentPage = 0;

  double get currentPage => this._currentPage;

  set currentPage(double currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }
}
