import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

part 'add_card_widgets_checkbox.g.dart';

class AddCardWidgetControl = _AddCardWidgetControlBase
    with _$AddCardWidgetControl;

abstract class _AddCardWidgetControlBase with Store, ChangeNotifier {
  @observable
  bool value1 = false;

  @action
  void changeBoxValue1(value) {
    value1 = value;
  }
}
