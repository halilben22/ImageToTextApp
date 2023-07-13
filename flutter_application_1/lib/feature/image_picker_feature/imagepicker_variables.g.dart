// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imagepicker_variables.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ImagePickerClass on _ImagePickerClassBase, Store {
  late final _$imageGelenAtom =
      Atom(name: '_ImagePickerClassBase.imageGelen', context: context);

  @override
  File? get imageGelen {
    _$imageGelenAtom.reportRead();
    return super.imageGelen;
  }

  @override
  set imageGelen(File? value) {
    _$imageGelenAtom.reportWrite(value, super.imageGelen, () {
      super.imageGelen = value;
    });
  }

  late final _$imgAtom =
      Atom(name: '_ImagePickerClassBase.img', context: context);

  @override
  File? get img {
    _$imgAtom.reportRead();
    return super.img;
  }

  @override
  set img(File? value) {
    _$imgAtom.reportWrite(value, super.img, () {
      super.img = value;
    });
  }

  late final _$scannedTextAtom =
      Atom(name: '_ImagePickerClassBase.scannedText', context: context);

  @override
  String? get scannedText {
    _$scannedTextAtom.reportRead();
    return super.scannedText;
  }

  @override
  set scannedText(String? value) {
    _$scannedTextAtom.reportWrite(value, super.scannedText, () {
      super.scannedText = value;
    });
  }

  late final _$imageAtom =
      Atom(name: '_ImagePickerClassBase.image', context: context);

  @override
  XFile? get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(XFile? value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  late final _$pickImageAsyncAction =
      AsyncAction('_ImagePickerClassBase.pickImage', context: context);

  @override
  Future<void> pickImage(ImageSource source) {
    return _$pickImageAsyncAction.run(() => super.pickImage(source));
  }

  late final _$getRecognisedTextAsyncAction =
      AsyncAction('_ImagePickerClassBase.getRecognisedText', context: context);

  @override
  Future<void> getRecognisedText(File image) {
    return _$getRecognisedTextAsyncAction
        .run(() => super.getRecognisedText(image));
  }

  @override
  String toString() {
    return '''
imageGelen: ${imageGelen},
img: ${img},
scannedText: ${scannedText},
image: ${image}
    ''';
  }
}
