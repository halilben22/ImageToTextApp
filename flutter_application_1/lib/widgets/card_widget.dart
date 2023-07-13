import 'package:flutter/material.dart';
import 'package:flutter_application_1/allTexts/all_texts.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../feature/theme_feature/theme_change.dart';
import '../view/view_options/options_view_screen.dart';
import '../widget_control/add_card_widget_feature.dart';
import '../widget_control/add_card_widgets_checkbox.dart';
import '../widget_control/add_card_widgets_titles.dart';
import '../widget_control/card_widget_list.dart';
import 'dialog_pop_up_widget/pop_up_dialog.dart';

class CheckCardWidget extends StatefulWidget {
  CheckCardWidget(
      {super.key,
      required this.value,
      required this.title,
      required this.featureTitle});
  bool value;
  String title;
  String featureTitle;

  @override
  State<CheckCardWidget> createState() => _CheckCardWidgetState();
}

class _CheckCardWidgetState extends State<CheckCardWidget> {
  @override
  Widget build(BuildContext context) {
    ThemeClass themeClass = Provider.of<ThemeClass>(context);
    var elevatedButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: themeClass.themeData == ThemeData.dark()
          ? const Color.fromARGB(255, 164, 164, 164)
          : Colors.black,
    );
    PopUpDialogClass popUpDialogClass =
        Provider.of<PopUpDialogClass>(context);

    AddCardWidgetFeaturesControl addCardWidgetFeaturesControl =
        Provider.of<AddCardWidgetFeaturesControl>(context);
    AddCardWidgetControl addCardWidgetControl =
        Provider.of<AddCardWidgetControl>(context);
    AddCardWidgetTitlesControl addCardWidgetTitlesControl =
        Provider.of<AddCardWidgetTitlesControl>(context);
    CardWidgetListControl cardWidgetListControl =
        Provider.of<CardWidgetListControl>(context);
    TextData textData = TextData();
    Future<void> OpenDialog() async {
      await showDialog(
          context: (context),
          builder: (context) => AlertDialog(
                title: Observer(builder: (_) {
                  return Column(
                    children: [
                      Text(textData.duzenle),
                      dividerForAllPage(themeClass: themeClass),
                      TextField(
                        maxLength: 25,
                        controller: TextEditingController(
                            text: addCardWidgetTitlesControl.title1),
                        onChanged: (value) {
                          popUpDialogClass.textForTitle = value;
                        },
                        autofocus: true,
                        decoration: InputDecoration(
                            labelText: textData.isimOzellik,
                            border: const OutlineInputBorder(),
                            hintStyle: const TextStyle(fontSize: 15)),
                      ),
                    ],
                  );
                }),
                content: Observer(builder: (_) {
                  return TextField(
                    maxLength: 75,
                    controller: TextEditingController(
                        text: addCardWidgetFeaturesControl.feature1),
                    onChanged: (value) {
                      popUpDialogClass.textForFeature = value;
                    },
                    decoration: InputDecoration(
                        labelText: textData.ozellikAciklama,
                        border: const OutlineInputBorder(),
                        hintStyle: const TextStyle(fontSize: 13)),
                  );
                }),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      elevatedButtonForBack(
                          elevatedButtonStyle: elevatedButtonStyle,
                          text: textData.geri),
                      elevatedButtonForOkayWidget(
                          elevatedButtonStyle: elevatedButtonStyle,
                          text: textData.tamam)
                    ],
                  )
                ],
              ));
    }

    return Observer(builder: (_) {
      return CheckboxListTile(
          title: Text(widget.title),
          subtitle: Text(widget.featureTitle),
          value: addCardWidgetControl.value1,
          secondary: Column(
            children: [
              Observer(builder: (_) {
                return Expanded(
                  flex: 1,
                  child: IconButton(
                      onPressed: () {
                        OpenDialog();
                      },
                      icon: const FaIcon(FontAwesomeIcons.pencil,
                          size: 17)),
                );
              }),
              Observer(builder: (_) {
                return Expanded(
                  flex: 1,
                  child: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      size: 21,
                    ),
                    onPressed: () {
                      addCardWidgetTitlesControl.title1 = null;
                      addCardWidgetFeaturesControl.feature1 = null;
                      popUpDialogClass.textForTitle = null;
                      popUpDialogClass.textForFeature = null;
                      addCardWidgetControl.value1 = false;
                      cardWidgetListControl.cardWidgetList.clear();
                    },
                  ),
                );
              }),
            ],
          ),
          onChanged: (value) {
            addCardWidgetControl.changeBoxValue1(value);
          });
    });
  }
}

class elevatedButtonForOkayWidget extends StatelessWidget {
  elevatedButtonForOkayWidget(
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
        Provider.of<AddCardWidgetControl>(context);
    AddCardWidgetTitlesControl addCardWidgetTitlesControl =
        Provider.of<AddCardWidgetTitlesControl>(context);
    CardWidgetListControl cardWidgetListControl =
        Provider.of<CardWidgetListControl>(context);
    AddCardWidgetFeaturesControl addCardWidgetFeaturesControl =
        Provider.of<AddCardWidgetFeaturesControl>(context);

    return ElevatedButton(
        style: elevatedButtonStyle,
        onPressed: () {
          addCardWidgetTitlesControl.title1 =
              popUpDialogClass.textForTitle;

          addCardWidgetFeaturesControl.feature1 =
              popUpDialogClass.textForFeature;
          cardWidgetListControl.cardWidgetList.clear();
          cardWidgetListControl.cardWidgetList.add(CheckCardWidget(
            value: addCardWidgetControl.value1,
            title: addCardWidgetTitlesControl.title1!,
            featureTitle: addCardWidgetFeaturesControl.feature1!,
          ));
          Navigator.pop(context);
        },
        child: SizedBox(
          width: 75,
          height: 30,
          child: Center(child: Text(text)),
        ));
  }
}
