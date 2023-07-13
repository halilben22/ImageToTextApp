// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_gpt_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChatGptClass on _ChatGptClassBase, Store {
  late final _$responseAtom =
      Atom(name: '_ChatGptClassBase.response', context: context);

  @override
  String? get response {
    _$responseAtom.reportRead();
    return super.response;
  }

  @override
  set response(String? value) {
    _$responseAtom.reportWrite(value, super.response, () {
      super.response = value;
    });
  }

  late final _$isResponsOKAtom =
      Atom(name: '_ChatGptClassBase.isResponsOK', context: context);

  @override
  bool get isResponsOK {
    _$isResponsOKAtom.reportRead();
    return super.isResponsOK;
  }

  @override
  set isResponsOK(bool value) {
    _$isResponsOKAtom.reportWrite(value, super.isResponsOK, () {
      super.isResponsOK = value;
    });
  }

  late final _$isResponseOkForOwnFeatureAtom = Atom(
      name: '_ChatGptClassBase.isResponseOkForOwnFeature', context: context);

  @override
  bool get isResponseOkForOwnFeature {
    _$isResponseOkForOwnFeatureAtom.reportRead();
    return super.isResponseOkForOwnFeature;
  }

  @override
  set isResponseOkForOwnFeature(bool value) {
    _$isResponseOkForOwnFeatureAtom
        .reportWrite(value, super.isResponseOkForOwnFeature, () {
      super.isResponseOkForOwnFeature = value;
    });
  }

  late final _$translatorAsyncAction =
      AsyncAction('_ChatGptClassBase.translator', context: context);

  @override
  Future<void> translator(String textForTranslate, String dil) {
    return _$translatorAsyncAction
        .run(() => super.translator(textForTranslate, dil));
  }

  late final _$ownFeatureAsyncAction =
      AsyncAction('_ChatGptClassBase.ownFeature', context: context);

  @override
  Future<void> ownFeature(String textForOwnFeature, String scannedText) {
    return _$ownFeatureAsyncAction
        .run(() => super.ownFeature(textForOwnFeature, scannedText));
  }

  @override
  String toString() {
    return '''
response: ${response},
isResponsOK: ${isResponsOK},
isResponseOkForOwnFeature: ${isResponseOkForOwnFeature}
    ''';
  }
}
