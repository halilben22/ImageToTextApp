import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';


part 'card_widget_list.g.dart';

class CardWidgetListControl = _CardWidgetListControlBase
    with _$CardWidgetListControl;

abstract class _CardWidgetListControlBase with Store, ChangeNotifier {
  @observable
  List cardWidgetList = [];
}
