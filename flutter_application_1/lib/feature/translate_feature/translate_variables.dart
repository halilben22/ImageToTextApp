import 'package:flutter/material.dart';

import 'package:mobx/mobx.dart';


part 'translate_variables.g.dart';

class TranslateClass = _TranslateClassBase
    with _$TranslateClass, ChangeNotifier;

abstract class _TranslateClassBase with Store {
  @observable
  List<String> countries = ["English", "Turkish"];

  @observable
  String? choosenCountry;
}
