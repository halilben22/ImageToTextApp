import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'theme_change.g.dart';

class ThemeClass = _ThemeClassBase with _$ThemeClass,ChangeNotifier;

abstract class _ThemeClassBase with Store {
  @observable
  ThemeData themeData = ThemeData.dark();
  @observable
  bool value = true;
  @action
  void changeTheme(value) {
    if (value == true) {
      themeData = ThemeData.dark();
    } else {
      themeData = ThemeData.light();
    }
  }
}
