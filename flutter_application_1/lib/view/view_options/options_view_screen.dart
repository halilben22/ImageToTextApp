import 'package:flutter/material.dart';
import 'package:flutter_application_1/allTexts/all_texts.dart';
import 'package:flutter_application_1/feature/checkbox_feature/checkbox_variables.dart';
import 'package:flutter_application_1/feature/theme_feature/theme_change.dart';
import 'package:flutter_application_1/feature/translate_feature/translate_variables.dart';
import 'package:flutter_application_1/model/chat_gpt_model.dart';
import 'package:flutter_application_1/widgets/card_widget.dart';

import 'package:flutter_application_1/widgets/dialog_pop_up_widget/pop_up_dialog.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:provider/provider.dart';

import '../../feature/image_picker_feature/imagepicker_variables.dart';
import '../../widget_control/add_card_widget_feature.dart';
import '../../widget_control/add_card_widgets_checkbox.dart';
import '../../widget_control/add_card_widgets_titles.dart';
import '../../widget_control/card_widget_list.dart';
import '../recognized_text_view/recognized_text_view_page.dart';

class OptionsView extends StatelessWidget {
  const OptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    PopUpDialogClass popUpDialogClass =
        Provider.of<PopUpDialogClass>(context);
    ThemeClass themeClass =
        Provider.of<ThemeClass>(context);
    var elevatedButtonStyle =
        ElevatedButton.styleFrom(
      backgroundColor:
          themeClass.themeData == ThemeData.dark()
              ? const Color.fromARGB(
                  255, 164, 164, 164)
              : Colors.black,
    );

    TextData textData = TextData();

    ChatGptClass chatGptClass =
        Provider.of<ChatGptClass>(context);
    AddCardWidgetFeaturesControl
        addCardWidgetFeaturesControl =
        Provider.of<AddCardWidgetFeaturesControl>(
            context);

    AddCardWidgetTitlesControl
        addCardWidgetTitlesControl =
        Provider.of<AddCardWidgetTitlesControl>(
            context);
    CardWidgetListControl cardWidgetListControl =
        Provider.of<CardWidgetListControl>(
            context);
    AddCardWidgetControl addCardWidgetControl =
        Provider.of<AddCardWidgetControl>(
            context);

    Future<void> OpenDialog() async {
      await showDialog(
          context: (context),
          builder: (context) => AlertDialog(
                title: Column(
                  children: [
                    Text(textData.ozellikEkle),
                    dividerForAllPage(
                        themeClass: themeClass),
                    Observer(builder: (_) {
                      return TextField(
                        maxLength: 25,
                        onChanged: (value) {
                          popUpDialogClass
                                  .textForTitle =
                              value;
                        },
                        autofocus: true,
                        decoration: InputDecoration(
                            border:
                                const OutlineInputBorder(),
                            hintText:
                                textData.isimVer,
                            hintStyle:
                                const TextStyle(
                                    fontSize:
                                        15)),
                      );
                    }),
                  ],
                ),
                content: Observer(builder: (_) {
                  return Column(
                    mainAxisSize:
                        MainAxisSize.min,
                    children: [
                      TextField(
                        maxLength: 75,
                        onChanged: (value) {
                          popUpDialogClass
                                  .textForFeature =
                              value;
                        },
                        decoration: InputDecoration(
                            border:
                                const OutlineInputBorder(),
                            hintText: textData
                                .neYapacak,
                            hintStyle:
                                const TextStyle(
                                    fontSize:
                                        13)),
                      ),
                      const Text(
                        "Lütfen yapay zekanın anlayabileceği dilde bir özellik yazınız.Yazım hatalarından olabildiğince kaçınınız.",
                        style: TextStyle(
                            fontSize: 12,
                            decoration:
                                TextDecoration
                                    .underline),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                            top: 8),
                        child: Text(
                            'Örnek kullanım:"Benim için yazıyı çevir","Benim için bu yazıdaki hayvan isimlerini bul""',
                            style: TextStyle(
                              fontSize: 12,
                            )),
                      )
                    ],
                  );
                }),
                actions: [
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,
                    children: [
                      elevatedButtonForBack(
                          elevatedButtonStyle:
                              elevatedButtonStyle,
                          text: textData.geri),
                      elevatedButtonForOkay(
                          elevatedButtonStyle:
                              elevatedButtonStyle,
                          text: textData.tamam)
                    ],
                  )
                ],
              ));
    }

    ImagePickerClass pickerClass =
        Provider.of<ImagePickerClass>(context);
    CheckBoxClass checkClass =
        Provider.of<CheckBoxClass>(context);

    TranslateClass translateClass =
        Provider.of<TranslateClass>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Center(
          child: Observer(builder: (_) {
            return Column(
              children: [
                pickerClass.imageGelen != null
                    ? Column(
                        children: [
                          dividerForAllPage(
                              themeClass:
                                  themeClass),
                          Image.file(
                            pickerClass
                                .imageGelen!,
                            width: 350,
                            height: 350,
                            fit: BoxFit.scaleDown,
                          ),
                          dividerForAllPage(
                              themeClass:
                                  themeClass),
                        ],
                      )
                    : Container(),
                dividerForAllPage(
                    themeClass: themeClass),
                Text(textData.ekstraOzellik),
                dividerForAllPage(
                    themeClass: themeClass),
                ListViewWidgetForTranslate(
                  themeClass: themeClass,
                  checkClass: checkClass,
                  translateClass: translateClass,
                ),
                addCardWidgetTitlesControl
                            .title1 !=
                        null
                    ? Observer(builder: (_) {
                        return SizedBox(
                            width: 350,
                            child: cardWidgetListControl
                                .cardWidgetList[0]);
                      })
                    : const SizedBox(),
                addCardWidgetTitlesControl
                            .title1 ==
                        null
                    ? SizedBox(
                        child: ElevatedButton(
                          //ElevatedButton
                          onPressed: () {
                            OpenDialog();
                          },
                          style:
                              elevatedButtonStyle,
                          child: Text(
                            textData.kendiOzellik,
                            style:
                                const TextStyle(
                                    color: Colors
                                        .white),
                          ),
                        ),
                      )
                    : const SizedBox(),
                Observer(builder: (_) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(
                            top: 50),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .spaceEvenly,
                      children: [
                        SizedBox(
                          width: 150,
                          height: 50,
                          child: ElevatedButton(
                            //ElevatedButton
                            onPressed: () {
                              Navigator.pop(
                                  context);
                            },
                            style:
                                elevatedButtonStyle,
                            child: Text(
                              textData.geri,
                              style:
                                  const TextStyle(
                                      color: Colors
                                          .white),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          height: 50,
                          child: ButtonForContiune(
                              checkClass:
                                  checkClass,
                              translateClass:
                                  translateClass,
                              chatGptClass:
                                  chatGptClass,
                              pickerClass:
                                  pickerClass,
                              textData: textData,
                              addCardWidgetControl:
                                  addCardWidgetControl,
                              addCardWidgetFeaturesControl:
                                  addCardWidgetFeaturesControl,
                              elevatedButtonStyle:
                                  elevatedButtonStyle,
                              themeClass:
                                  themeClass),
                        ),
                      ],
                    ),
                  );
                })
              ],
            );
          }),
        ),
      ),
    );
  }
}

class ButtonForContiune extends StatelessWidget {
  const ButtonForContiune({
    super.key,
    required this.checkClass,
    required this.translateClass,
    required this.chatGptClass,
    required this.pickerClass,
    required this.textData,
    required this.addCardWidgetControl,
    required this.addCardWidgetFeaturesControl,
    required this.elevatedButtonStyle,
    required this.themeClass,
  });

  final CheckBoxClass checkClass;
  final TranslateClass translateClass;
  final ChatGptClass chatGptClass;
  final ImagePickerClass pickerClass;
  final TextData textData;
  final AddCardWidgetControl addCardWidgetControl;
  final AddCardWidgetFeaturesControl
      addCardWidgetFeaturesControl;
  final ButtonStyle elevatedButtonStyle;
  final ThemeClass themeClass;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return ElevatedButton(
        //ElevatedButton
        onPressed: () {
          if (checkClass.valueCheckBox1 == true) {
            if (translateClass.choosenCountry !=
                null) {
              chatGptClass.translator(
                  pickerClass.scannedText!,
                  translateClass.choosenCountry!);
            } else {
              chatGptClass.isResponsOK = true;
              chatGptClass.response =
                  textData.donDilSec;
            }
          }

          if (pickerClass.scannedText != "") {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const RecognizedTextPage()));
          } else {
            Fluttertoast.showToast(
                msg: textData.toastMesaj,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }

          if (addCardWidgetControl.value1 ==
              true) {
            chatGptClass.ownFeature(
                addCardWidgetFeaturesControl
                    .feature1!,
                pickerClass.scannedText!);
          }
        },
        style: elevatedButtonStyle,
        child: Text(
          textData.devam,
          style: const TextStyle(
              color: Colors.white),
        ),
      );
    });
  }
}

class ListViewWidgetForTranslate
    extends StatelessWidget {
  const ListViewWidgetForTranslate({
    super.key,
    required this.themeClass,
    required this.checkClass,
    required this.translateClass,
  });

  final ThemeClass themeClass;
  final CheckBoxClass checkClass;
  final TranslateClass translateClass;

  @override
  Widget build(BuildContext context) {
    TextData textData = TextData();
    return Observer(builder: (_) {
      return Column(
        children: [
          SizedBox(
            width: 350,
            child: checkBoxWidgetForTranslate(
                themeClass: themeClass,
                checkClass: checkClass,
                text: textData.yaziCevir,
                valueCheckBox:
                    checkClass.valueCheckBox1),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context)
                        .padding
                        .horizontal /
                    2),
            child:
                checkClass.valueCheckBox1 == true
                    ? SizedBox(
                        width:
                            MediaQuery.of(context)
                                    .size
                                    .width /
                                0.2,
                        child: Card(
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets
                                        .all(8.0),
                                child: Text(
                                    textData
                                        .dilSec),
                              ),
                              Observer(
                                  builder: (_) {
                                return PopupMenuButton(
                                    itemBuilder:
                                        (context) =>
                                            <PopupMenuEntry>[
                                              PopupMenuItem(
                                                  onTap: () {
                                                    translateClass.choosenCountry = "english";
                                                  },
                                                  child: Text(translateClass.countries.first)),
                                              PopupMenuItem(
                                                  onTap: () {
                                                    translateClass.choosenCountry = "turkish";
                                                  },
                                                  child: Text(translateClass.countries.last)),
                                            ]);
                              }),
                            ],
                          ),
                        ),
                      )
                    : const SizedBox(),
          ),
        ],
      );
    });
  }
}

class elevatedButtonForBack
    extends StatelessWidget {
  elevatedButtonForBack(
      {super.key,
      required this.elevatedButtonStyle,
      required this.text});

  final ButtonStyle elevatedButtonStyle;
  String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: elevatedButtonStyle,
        onPressed: () {
          Navigator.pop(context);
        },
        child: SizedBox(
          width: 75,
          height: 30,
          child: Center(child: Text(text)),
        ));
  }
}

class elevatedButtonForOkay
    extends StatelessWidget {
  elevatedButtonForOkay(
      {super.key,
      required this.elevatedButtonStyle,
      required this.text});
  OptionsView optionsView = const OptionsView();
  final ButtonStyle elevatedButtonStyle;
  String text;

  @override
  Widget build(BuildContext context) {
    PopUpDialogClass popUpDialogClass =
        Provider.of<PopUpDialogClass>(context);

    AddCardWidgetControl addCardWidgetControl =
        Provider.of<AddCardWidgetControl>(
            context);
    AddCardWidgetTitlesControl
        addCardWidgetTitlesControl =
        Provider.of<AddCardWidgetTitlesControl>(
            context);
    CardWidgetListControl cardWidgetListControl =
        Provider.of<CardWidgetListControl>(
            context);
    AddCardWidgetFeaturesControl
        addCardWidgetFeaturesControl =
        Provider.of<AddCardWidgetFeaturesControl>(
            context);

    return ElevatedButton(
        style: elevatedButtonStyle,
        onPressed: () {
          if (addCardWidgetTitlesControl.title1 ==
              null) {
            addCardWidgetTitlesControl.title1 =
                popUpDialogClass.textForTitle;

            addCardWidgetFeaturesControl
                    .feature1 =
                popUpDialogClass.textForFeature;

            cardWidgetListControl.cardWidgetList
                .add(CheckCardWidget(
              value: addCardWidgetControl.value1,
              title: addCardWidgetTitlesControl
                  .title1!,
              featureTitle:
                  addCardWidgetFeaturesControl
                      .feature1!,
            ));

            Navigator.pop(context);
          }
        },
        child: SizedBox(
          width: 75,
          height: 30,
          child: Center(child: Text(text)),
        ));
  }
}

class checkBoxWidgetForTranslate
    extends StatelessWidget {
  const checkBoxWidgetForTranslate({
    super.key,
    required this.themeClass,
    required this.checkClass,
    required this.text,
    required this.valueCheckBox,
  });

  final ThemeClass themeClass;
  final CheckBoxClass checkClass;
  final String text;
  final bool valueCheckBox;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return CheckboxListTile(
        checkColor: themeClass.themeData ==
                ThemeData.dark()
            ? Colors.black
            : Colors.white,
        activeColor: themeClass.themeData ==
                ThemeData.dark()
            ? Colors.white
            : Colors.black,
        title: Text(text),
        value: valueCheckBox,
        onChanged: (value) {
          checkClass.changeCheckBoxValue1(value!);
        },
      );
    });
  }
}

class dividerForAllPage extends StatelessWidget {
  const dividerForAllPage({
    super.key,
    required this.themeClass,
  });

  final ThemeClass themeClass;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color:
          themeClass.themeData == ThemeData.dark()
              ? Colors.white
              : Colors.black,
    );
  }
}
