import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'checkbox_variables.g.dart';

class CheckBoxClass = _CheckBoxClassBase
    with _$CheckBoxClass, ChangeNotifier;

abstract class _CheckBoxClassBase with Store {
  @observable
  bool valueCheckBox1 = false;

  @action
  void changeCheckBoxValue1(bool value1) {
    valueCheckBox1 = value1;
  }
}
