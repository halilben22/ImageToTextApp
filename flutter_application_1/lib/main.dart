import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/checkbox_feature/checkbox_variables.dart';
import 'package:flutter_application_1/feature/image_picker_feature/imagepicker_variables.dart';
import 'package:flutter_application_1/feature/theme_feature/theme_change.dart';
import 'package:flutter_application_1/feature/translate_feature/translate_variables.dart';
import 'package:flutter_application_1/model/chat_gpt_model.dart';
import 'package:flutter_application_1/view/first_screen_view/screen_view.dart';
import 'package:flutter_application_1/widget_control/add_card_widget_feature.dart';
import 'package:flutter_application_1/widget_control/add_card_widgets_checkbox.dart';
import 'package:flutter_application_1/widget_control/add_card_widgets_titles.dart';
import 'package:flutter_application_1/widget_control/card_widget_list.dart';

import 'package:flutter_application_1/widgets/dialog_pop_up_widget/pop_up_dialog.dart';

import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeClass>(
              create: (_) => ThemeClass()),
          ChangeNotifierProvider<
                  ImagePickerClass>(
              create: (_) => ImagePickerClass()),
          ChangeNotifierProvider<CheckBoxClass>(
              create: (_) => CheckBoxClass()),
          ChangeNotifierProvider<TranslateClass>(
              create: (_) => TranslateClass()),
          ChangeNotifierProvider<ChatGptClass>(
              create: (_) => ChatGptClass()),
          ChangeNotifierProvider<
                  PopUpDialogClass>(
              create: (_) => PopUpDialogClass()),
          ChangeNotifierProvider<
                  AddCardWidgetFeaturesControl>(
              create: (_) =>
                  AddCardWidgetFeaturesControl()),
          ChangeNotifierProvider<
                  AddCardWidgetControl>(
              create: (_) =>
                  AddCardWidgetControl()),
          ChangeNotifierProvider<
                  AddCardWidgetTitlesControl>(
              create: (_) =>
                  AddCardWidgetTitlesControl()),
          ChangeNotifierProvider<
                  CardWidgetListControl>(
              create: (_) =>
                  CardWidgetListControl()),
        ],
        child: const MyApp(),
      ),
    );

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData themeData = ThemeData.dark();

  @override
  Widget build(BuildContext context) {
    ThemeClass themeClass =
        Provider.of<ThemeClass>(context);

    return Observer(builder: (_) {
      return MaterialApp(
          theme: themeClass.themeData,
          debugShowCheckedModeBanner: false,
          title: 'ImageToText',
          home: MainScreen());
    });
  }
}
