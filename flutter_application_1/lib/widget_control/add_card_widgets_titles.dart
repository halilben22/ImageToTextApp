import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:mobx/mobx.dart';
part 'add_card_widgets_titles.g.dart';

class AddCardWidgetTitlesControl = _AddCardWidgetTitlesControlBase
    with _$AddCardWidgetTitlesControl;

abstract class _AddCardWidgetTitlesControlBase with Store,ChangeNotifier{
  @observable
  String? title1;


}
