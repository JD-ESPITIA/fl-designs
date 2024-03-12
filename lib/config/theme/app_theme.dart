import 'package:flutter/material.dart';

class AppTheme with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;
  ThemeData _currentTheme = ThemeData.dark();

  AppTheme(int theme){
    switch (theme) {
      case 1: //light
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light().copyWith(
          hintColor: Colors.blueAccent
        );
        break;
      case 2: //dark
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark().copyWith(
          hintColor: Colors.green
        );
        break;
      case 3: //custom
        _darkTheme = false;
        _customTheme = true;
        _currentTheme = ThemeData.light().copyWith(
          hintColor: Colors.pink
        );
        break;
      default:
        _customTheme = false;
        _currentTheme = ThemeData.light();
         break;
    }
  }


  
  bool get darkTheme => _darkTheme;
  bool get customTheme => _customTheme;
  ThemeData get currentTheme  => _currentTheme;


  set darkTheme(bool value) {
    _customTheme = false;
    _darkTheme = value;
    print('valueeeeeeeeeee');
    print(value);
    
    if(value){
      _currentTheme = ThemeData.dark().copyWith(
          hintColor: Colors.green
        );;
    } else {
      _currentTheme = ThemeData.light().copyWith(
          hintColor: Colors.blueAccent
        );
    }

    notifyListeners();
  }


  set customTheme(bool value){
    _customTheme = value;
    _darkTheme = false;
    
    if(value){
      _currentTheme = ThemeData.dark().copyWith(
        hintColor: Colors.pink
      );
    } else {
      _currentTheme = ThemeData.light().copyWith(
          hintColor: Colors.blueAccent
        );
    }

    notifyListeners();
  }

}
