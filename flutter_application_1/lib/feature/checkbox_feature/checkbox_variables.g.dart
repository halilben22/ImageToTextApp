// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkbox_variables.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CheckBoxClass on _CheckBoxClassBase, Store {
  late final _$valueCheckBox1Atom =
      Atom(name: '_CheckBoxClassBase.valueCheckBox1', context: context);

  @override
  bool get valueCheckBox1 {
    _$valueCheckBox1Atom.reportRead();
    return super.valueCheckBox1;
  }

  @override
  set valueCheckBox1(bool value) {
    _$valueCheckBox1Atom.reportWrite(value, super.valueCheckBox1, () {
      super.valueCheckBox1 = value;
    });
  }

  late final _$_CheckBoxClassBaseActionController =
      ActionController(name: '_CheckBoxClassBase', context: context);

  @override
  void changeCheckBoxValue1(bool value1) {
    final _$actionInfo = _$_CheckBoxClassBaseActionController.startAction(
        name: '_CheckBoxClassBase.changeCheckBoxValue1');
    try {
      return super.changeCheckBoxValue1(value1);
    } finally {
      _$_CheckBoxClassBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
valueCheckBox1: ${valueCheckBox1}
    ''';
  }
}
