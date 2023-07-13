import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/theme_feature/theme_change.dart';


import 'package:flutter_application_1/view/view_options/options_view_screen.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

import 'package:provider/provider.dart';

import '../../feature/image_picker_feature/imagepicker_variables.dart';


class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final imagePickerClass = ImagePickerClass();
  final themeChange = ThemeClass();
  @override
  Widget build(BuildContext context) {
    ThemeClass themeClass = Provider.of<ThemeClass>(context);
    ImagePickerClass pickerClass =
        Provider.of<ImagePickerClass>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          switchThemeButton(themeClass),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Center(
          child: Observer(builder: (_) {
            return Column(
              children: [
                pickerClass.imageGelen == null
                    ? const Text(
                        "Choose Image",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 50),
                      )
                    : const Text(""),
                GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Observer(builder: (_) {
                              return Wrap(
                                children: [
                                  ListTile(
                                    leading: const Icon(Icons.camera),
                                    title: const Text("Camera"),
                                    onTap: () {
                                      pickerClass.pickImage(
                                          ImageSource.camera);

                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    leading: const FaIcon(
                                        FontAwesomeIcons.image),
                                    title: const Text("Gallery"),
                                    onTap: () {
                                      pickerClass.pickImage(
                                          ImageSource.gallery);

                                      Navigator.pop(context);
                                    },
                                  )
                                ],
                              );
                            });
                          });
                    },
                    child: pickerClass.imageGelen != null
                        ? Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: themeClass.themeData ==
                                            ThemeData.dark()
                                        ? const Color.fromARGB(
                                            255, 164, 164, 164)
                                        : Colors.black)),
                            child: Image.file(
                              pickerClass.imageGelen!,
                              width: 350,
                              height: 350,
                              fit: BoxFit.scaleDown,
                            ),
                          )
                        : Container(
                            width: 350,
                            height: 350,
                            color: const Color.fromARGB(
                                255, 144, 142, 142),
                            child: const Icon(
                              Icons.ads_click_outlined,
                              size: 150,
                              color: Colors.grey,
                            ),
                          )),
                Padding(
                    padding:
                        const EdgeInsets.only(top: 150, bottom: 10),
                    child: pickerClass.imageGelen != null
                        ? SizedBox(
                            width: 350,
                            height: 50,
                            child: Observer(builder: (_) {
                              return ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        themeClass.themeData ==
                                                ThemeData.dark()
                                            ? const Color.fromARGB(
                                                255, 164, 164, 164)
                                            : Colors.black,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const OptionsView()));
                                  },
                                  child: const Text("Devam et",
                                      style:
                                          TextStyle(fontSize: 20)));
                            }),
                          )
                        : null),
              ],
            );
          }),
        ),
      ),
    );
  }

  Observer switchThemeButton(ThemeClass themeClass) {
    return Observer(builder: (_) {
      return Row(
        children: [
          themeClass.value == true
              ?const Text("Dark Theme")
              : const Text(
                  "Light Theme",
                  style: TextStyle(color: Colors.black),
                ),
          Switch(
            activeColor: const Color.fromARGB(255, 0, 0, 0),
            value: themeClass.value,
            onChanged: (value) {
              themeClass.changeTheme(value);
              themeClass.value = value;
            },
          ),
        ],
      );
    });
  }
}
