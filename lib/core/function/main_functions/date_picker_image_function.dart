//?------------method show date picker ------------------------------------------

import 'package:chat_2/core/shared/shared_pref.dart';
import 'package:chat_2/core/strings/color_manager.dart';
import 'package:chat_2/core/strings/state_theme_string.dart';
import 'package:flutter/material.dart';

Future<void> selectDate(
    BuildContext context, TextEditingController controller) async {
  DateTime? selectedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
    builder: (BuildContext context, Widget? child) {
      if (AppSharedPreferences.getThemeStatusString() ==
          AppStateThemeString.darkTheme) {
        return Theme(
          data: ThemeData.dark().copyWith(
            primaryColor: Colors.black,
            hintColor: Colors.red,
            colorScheme: ColorScheme.light(primary: Colors.black),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child ?? SizedBox(),
        );
      } else {
        Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColor.kPrimaryColor,
            hintColor: AppColor.kErroreBorderColor,
            colorScheme: ColorScheme.light(primary: AppColor.kPrimaryColor),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child ?? SizedBox(),
        );
      }

      return Theme(
        data: AppSharedPreferences.getThemeStatusString() ==
                AppStateThemeString.darkTheme
            ? ThemeData.dark().copyWith(
                primaryColor: Colors.black,
                hintColor: Colors.red,
                colorScheme: ColorScheme.light(primary: Colors.black),
                buttonTheme:
                    ButtonThemeData(textTheme: ButtonTextTheme.primary),
              )
            : ThemeData.light().copyWith(
                primaryColor: AppColor.kPrimaryColor,
                hintColor: AppColor.kErroreBorderColor,
                colorScheme: ColorScheme.light(primary: AppColor.kPrimaryColor),
                buttonTheme:
                    ButtonThemeData(textTheme: ButtonTextTheme.primary),
              ),
        child: child ?? SizedBox(),
      );
    },
  );
  if (selectedDate != null) {
    controller.text =
        selectedDate.toString().substring(0, 10).replaceAll("-", "/");
  }
}
