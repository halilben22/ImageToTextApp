// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translate_variables.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TranslateClass on _TranslateClassBase, Store {
  late final _$countriesAtom =
      Atom(name: '_TranslateClassBase.countries', context: context);

  @override
  List<String> get countries {
    _$countriesAtom.reportRead();
    return super.countries;
  }

  @override
  set countries(List<String> value) {
    _$countriesAtom.reportWrite(value, super.countries, () {
      super.countries = value;
    });
  }

  late final _$choosenCountryAtom =
      Atom(name: '_TranslateClassBase.choosenCountry', context: context);

  @override
  String? get choosenCountry {
    _$choosenCountryAtom.reportRead();
    return super.choosenCountry;
  }

  @override
  set choosenCountry(String? value) {
    _$choosenCountryAtom.reportWrite(value, super.choosenCountry, () {
      super.choosenCountry = value;
    });
  }

  @override
  String toString() {
    return '''
countries: ${countries},
choosenCountry: ${choosenCountry}
    ''';
  }
}
