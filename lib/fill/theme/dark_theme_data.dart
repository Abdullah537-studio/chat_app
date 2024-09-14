import 'package:chat_2/core/strings/color_manager.dart';
import 'package:chat_2/fill/theme/input_decoration_theme.dart';
import 'package:chat_2/generate/theme/text_dark_theme.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
    hoverColor: AppColor.kSecondaryDarkColor,
    cardColor: AppColor.kPrimaryDarkColor,
    primaryColor: AppColor.kPrimaryDarkColor,
    iconTheme: IconThemeData(color: AppColor.kColorWhite),
    textTheme: darktextTheme,
    // primaryIconTheme:IconThemeData(color: ) ,

    //! drop down menu
    // dropdownMenuTheme: DropdownMenuThemeData(
    //     inputDecorationTheme: custominputDecorationDropDownTheme),
    fontFamily: 'Poppins',
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.kPrimaryColor,
      centerTitle: true,
    ),
    progressIndicatorTheme:
        ProgressIndicatorThemeData(color: AppColor.kPrimaryColor),
    //! text form field
    inputDecorationTheme: custominputDecorationTheme);
