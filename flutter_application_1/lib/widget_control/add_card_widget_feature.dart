import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';


part 'add_card_widget_feature.g.dart';

class AddCardWidgetFeaturesControl = _AddCardWidgetFeaturesControlBase
    with _$AddCardWidgetFeaturesControl;

abstract class _AddCardWidgetFeaturesControlBase
    with Store, ChangeNotifier {
  @observable
  String? feature1;


}
