import 'package:chat_2/core/strings/color_manager.dart';
import 'package:chat_2/fill/theme/input_decoration_theme.dart';
import 'package:chat_2/generate/theme/text_dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData darkTheme = ThemeData(
    hoverColor: AppColor.kSecondaryDarkColor,
    cardColor: AppColor.kPrimaryDarkColor,
    primaryColor: AppColor.kPrimaryDarkColor,
    iconTheme: IconThemeData(color: AppColor.kColorWhite),
    textTheme: darktextTheme,
    // primaryIconTheme:IconThemeData(color: ) ,
    datePickerTheme: DatePickerThemeData(
      dayStyle: TextStyle(fontSize: 16.sp, color: AppColor.kColorBlack),
      dividerColor: AppColor.kPrimaryColor,
      todayBackgroundColor: MaterialStatePropertyAll(AppColor.kPrimaryColor),
      cancelButtonStyle: ButtonStyle(
        textStyle: MaterialStatePropertyAll(
            TextStyle(fontSize: 16.sp, color: AppColor.kColorWhite)),
        backgroundColor: MaterialStatePropertyAll(AppColor.kPrimaryColor),
      ),
      confirmButtonStyle: ButtonStyle(
        textStyle: MaterialStatePropertyAll(
            TextStyle(fontSize: 16.sp, color: AppColor.kColorWhite)),
        backgroundColor: MaterialStatePropertyAll(AppColor.kPrimaryColor),
      ),
    ),
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
