import 'package:chat_2/core/strings/color_manager.dart';
import 'package:flutter/material.dart';

void showSnackBarMain(context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: AppColor.kColorDarkMode,
      content: Text(
        message,
        style: TextStyle(color: AppColor.kColorWhite),
      )));
}
