import 'package:chat_2/core/strings/color_manager.dart';
import 'input_decoration_theme.dart';
import 'package:chat_2/generate/theme/text_light_theme.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    primaryColor: AppColor.kSecondaryColor,
    hoverColor: AppColor.kSecondaryColor,
    cardColor: Colors.blueGrey,
    iconTheme: IconThemeData(color: AppColor.kColorBlack),
    textTheme: lightTextTheme,
    fontFamily: 'Poppins',
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.kPrimaryColor,
      centerTitle: true,
    ),
    progressIndicatorTheme:
        ProgressIndicatorThemeData(color: AppColor.kPrimaryColor),
    //! text form field
    inputDecorationTheme: custominputDecorationTheme);
