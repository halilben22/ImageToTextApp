import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'pop_up_dialog.g.dart';

class PopUpDialogClass = _PopUpDialogClassBase
    with _$PopUpDialogClass;

abstract class _PopUpDialogClassBase with Store, ChangeNotifier {
  @observable
  String? textForTitle;

  @observable
  String? textForFeature;
}
