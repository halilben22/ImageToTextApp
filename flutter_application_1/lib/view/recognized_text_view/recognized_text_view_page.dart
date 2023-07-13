import 'package:flutter/material.dart';
import 'package:flutter_application_1/allTexts/all_texts.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../feature/checkbox_feature/checkbox_variables.dart';

import '../../feature/image_picker_feature/imagepicker_variables.dart';
import '../../feature/theme_feature/theme_change.dart';
import '../../feature/translate_feature/translate_variables.dart';
import '../../model/chat_gpt_model.dart';
import '../../widget_control/add_card_widget_feature.dart';
import '../../widget_control/add_card_widgets_checkbox.dart';
import '../../widget_control/add_card_widgets_titles.dart';

class RecognizedTextPage extends StatelessWidget {
  const RecognizedTextPage({super.key});

  @override
  Widget build(BuildContext context) {
    AddCardWidgetControl addCardWidgetControl =
        Provider.of<AddCardWidgetControl>(context);
    AddCardWidgetTitlesControl addCardWidgetTitlesControl =
        Provider.of<AddCardWidgetTitlesControl>(context);

    ImagePickerClass pickerClass =
        Provider.of<ImagePickerClass>(context);
    CheckBoxClass checkClass = Provider.of<CheckBoxClass>(context);

    ChatGptClass chatGptClass = Provider.of<ChatGptClass>(context);
    TextData textData = TextData();
    ThemeClass themeClass = Provider.of<ThemeClass>(context);
    var elevatedButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: themeClass.themeData == ThemeData.dark()
          ? const Color.fromARGB(255, 164, 164, 164)
          : Colors.black,
    );

    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Column(
            children: [
              Expanded(
                child: Observer(builder: (_) {
                  return ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            NewWidgetForScannedText(
                                text1: "Seçilen yazı",
                                text2: pickerClass.scannedText),
                            checkClass.valueCheckBox1 == true
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15),
                                    child: Observer(builder: (_) {
                                      return NewWidgetForTranslate(
                                          text1: "Yazıyı çevir",
                                          text2:
                                              chatGptClass.response);
                                    }),
                                  )
                                : const SizedBox(),
                            addCardWidgetControl.value1 == true
                                ? Observer(builder: (_) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15),
                                      child: NewWidgetForAddedFeature(
                                          text1:
                                              addCardWidgetTitlesControl
                                                  .title1,
                                          text2: chatGptClass
                                              .responseFeature),
                                    );
                                  })
                                : const SizedBox(),
                          ],
                        );
                      });
                }),
              ),
              Padding(
                padding: const EdgeInsets.all(45.0),
                child: SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    //ElevatedButton
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: elevatedButtonStyle,
                    child: Text(
                      textData.geri,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

class NewWidgetForScannedText extends StatelessWidget {
  const NewWidgetForScannedText(
      {super.key, required this.text1, required this.text2});

  final String? text1;
  final String? text2;

  @override
  Widget build(BuildContext context) {
    ThemeClass themeClass = Provider.of<ThemeClass>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: themeClass.themeData == ThemeData.dark()
            ? Colors.white
            : Colors.black,
        child: ExpansionTile(
          collapsedIconColor: themeClass.themeData == ThemeData.dark()
              ? Colors.black
              : Colors.white,
          iconColor: themeClass.themeData == ThemeData.dark()
              ? Colors.black
              : Colors.white,
          title: Text(
            text1!,
            style: TextStyle(
              color: themeClass.themeData == ThemeData.dark()
                  ? Colors.black
                  : Colors.white,
            ),
          ),
          children: <Widget>[
            Observer(builder: (_) {
              return SelectableText(
                text2!,
                minLines: 1,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16,
                  color: themeClass.themeData == ThemeData.dark()
                      ? Colors.black
                      : Colors.white,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class NewWidgetForTranslate extends StatelessWidget {
  const NewWidgetForTranslate(
      {super.key, required this.text1, required this.text2});

  final String? text1;
  final String? text2;

  @override
  Widget build(BuildContext context) {
    ImagePickerClass pickerClass =
        Provider.of<ImagePickerClass>(context);
    TranslateClass translateClass =
        Provider.of<TranslateClass>(context);
    ChatGptClass chatGptClass = Provider.of<ChatGptClass>(context);
    ThemeClass themeClass = Provider.of<ThemeClass>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: themeClass.themeData == ThemeData.dark()
            ? Colors.white
            : Colors.black,
        child: ExpansionTile(
          collapsedIconColor: themeClass.themeData == ThemeData.dark()
              ? Colors.black
              : Colors.white,
          iconColor: themeClass.themeData == ThemeData.dark()
              ? Colors.black
              : Colors.white,
          title: Text(
            text1!,
            style: TextStyle(
              color: themeClass.themeData == ThemeData.dark()
                  ? Colors.black
                  : Colors.white,
            ),
          ),
          children: <Widget>[
            Observer(builder: (_) {
              return chatGptClass.isResponsOK == true
                  ? SelectableText(
                      text2!,
                      minLines: 1,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 16,
                        color:
                            themeClass.themeData == ThemeData.dark()
                                ? Colors.black
                                : Colors.white,
                      ),
                    )
                  : const SizedBox(
                      width: 30,
                      height: 30,
                      child: CircularProgressIndicator());
            }),
            ElevatedButton(
                onPressed: () {
                  chatGptClass.isResponsOK = false;
                  chatGptClass.translator(pickerClass.scannedText!,
                      translateClass.choosenCountry!);
                },
                child: const Text("Yenile"))
          ],
        ),
      ),
    );
  }
}

class NewWidgetForAddedFeature extends StatelessWidget {
  const NewWidgetForAddedFeature(
      {super.key, required this.text1, required this.text2});

  final String? text1;
  final String? text2;

  @override
  Widget build(BuildContext context) {
    AddCardWidgetFeaturesControl addCardWidgetFeaturesControl =
        Provider.of<AddCardWidgetFeaturesControl>(context);
    ImagePickerClass pickerClass =
        Provider.of<ImagePickerClass>(context);
    ChatGptClass chatGptClass = Provider.of<ChatGptClass>(context);
    ThemeClass themeClass = Provider.of<ThemeClass>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: themeClass.themeData == ThemeData.dark()
            ? Colors.white
            : Colors.black,
        child: ExpansionTile(
          collapsedIconColor: themeClass.themeData == ThemeData.dark()
              ? Colors.black
              : Colors.white,
          iconColor: themeClass.themeData == ThemeData.dark()
              ? Colors.black
              : Colors.white,
          title: Text(
            text1!,
            style: TextStyle(
              color: themeClass.themeData == ThemeData.dark()
                  ? Colors.black
                  : Colors.white,
            ),
          ),
          children: <Widget>[
            Observer(builder: (_) {
              return chatGptClass.isResponseOkForOwnFeature == true
                  ? SelectableText(
                      text2!,
                      minLines: 1,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 16,
                        color:
                            themeClass.themeData == ThemeData.dark()
                                ? Colors.black
                                : Colors.white,
                      ),
                    )
                  : const SizedBox(
                      width: 30,
                      height: 30,
                      child: CircularProgressIndicator());
            }),
            ElevatedButton(
                onPressed: () {
                  chatGptClass.isResponseOkForOwnFeature = false;
                  chatGptClass.ownFeature(
                      addCardWidgetFeaturesControl.feature1!,
                      pickerClass.scannedText!);
                },
                child: const Text("Yenile"))
          ],
        ),
      ),
    );
  }
}
