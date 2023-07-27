import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeManager with ChangeNotifier{
  ThemeMode _themeMode=ThemeMode.system;
  get themeMode =>_themeMode;
  toggletheme(bool isdark){
    _themeMode=isdark?ThemeMode.dark:ThemeMode.light;
    notifyListeners();
  }
}