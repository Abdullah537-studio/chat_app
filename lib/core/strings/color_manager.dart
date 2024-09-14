import 'package:flutter/material.dart';

class AppColor {
  static Color kSecondaryColor = Color(0xffF2F2F2);
  static Color kPrimaryColor = Color(0xffFF6F00);
  static Color kPrimaryDarkColor = Color.fromARGB(255, 68, 72, 112);
  static Color kSecondaryDarkColor = Colors.blueGrey;
  static Color kErroreBorderColor = Colors.red;
  static Color kErroreFoucaseBorderColor = Color.fromARGB(255, 94, 17, 11);
  static Color kColorBlack = Colors.black;
  static Color kColorWhite = Colors.white;
  static Color kColorTransparent = Colors.transparent;
  static Color kColorGrey = Colors.grey;
  static Color kColorDarkMode = Color.fromARGB(255, 134, 25, 17);
  static Color kColorIconDisable = Color(0xff2E2E2E);
  static Color? iconColorGrey = MaterialStateColor.resolveWith(
    (states) {
      if (states.contains(MaterialState.error)) {
        return Colors.red;
      }
      if (states.contains(MaterialState.focused)) {
        return kPrimaryColor;
      }
      return AppColor.kColorBlack;
    },
  );
}
