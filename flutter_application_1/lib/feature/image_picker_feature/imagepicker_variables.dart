import 'dart:io';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
part 'imagepicker_variables.g.dart';

class ImagePickerClass = _ImagePickerClassBase
    with _$ImagePickerClass, ChangeNotifier;

abstract class _ImagePickerClassBase with Store {
  @observable
  File? imageGelen;
  @observable
  File? img;
  @observable
  String? scannedText;

  @observable
  XFile? image;
  @action
  Future<void> pickImage(ImageSource source) async {
    image = await ImagePicker().pickImage(source: source);

    if (image == null) {
      return;
    } else {
      img = File(image!.path);

      imageGelen = img;

      getRecognisedText(imageGelen!);
    }
  }

  @action
  Future<void> getRecognisedText(File image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final textDetector = GoogleMlKit.vision.textRecognizer();
    final recognisedText =
        await textDetector.processImage(inputImage);
    scannedText = recognisedText.text;
  }
}
