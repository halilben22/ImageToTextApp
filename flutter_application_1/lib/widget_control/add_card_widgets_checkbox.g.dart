// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_card_widgets_checkbox.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddCardWidgetControl on _AddCardWidgetControlBase, Store {
  late final _$value1Atom =
      Atom(name: '_AddCardWidgetControlBase.value1', context: context);

  @override
  bool get value1 {
    _$value1Atom.reportRead();
    return super.value1;
  }

  @override
  set value1(bool value) {
    _$value1Atom.reportWrite(value, super.value1, () {
      super.value1 = value;
    });
  }

  late final _$_AddCardWidgetControlBaseActionController =
      ActionController(name: '_AddCardWidgetControlBase', context: context);

  @override
  void changeBoxValue1(dynamic value) {
    final _$actionInfo = _$_AddCardWidgetControlBaseActionController
        .startAction(name: '_AddCardWidgetControlBase.changeBoxValue1');
    try {
      return super.changeBoxValue1(value);
    } finally {
      _$_AddCardWidgetControlBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value1: ${value1}
    ''';
  }
}
