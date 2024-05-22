import 'package:chat_2/core/strings/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextTheme darktextTheme = TextTheme(
//? title large for welcome only (splach view)
  titleLarge: TextStyle(
    fontSize: 40.sp,
    color: AppColor.kColorBlack,
    fontWeight: FontWeight.bold,
  ),
//? title medium for  appBar text have color black or white as (them)
  titleMedium: TextStyle(
    fontSize: 25.sp,
    color: AppColor.kColorWhite,
    fontWeight: FontWeight.w400,
  ),
//? title small  for setting
  titleSmall: TextStyle(
    fontSize: 20.sp,
    color: AppColor.kColorWhite,
    fontWeight: FontWeight.w400,
  ),
//? body medium for all word color only black
  bodyMedium: TextStyle(
    fontSize: 16.sp,
    color: AppColor.kColorBlack,
  ),
//? body large for text change with theme
  bodyLarge: TextStyle(
    fontSize: 35.sp,
    color: AppColor.kPrimaryColor,
  ),
//? body small for partner information in card
  bodySmall: TextStyle(
    fontSize: 12.sp,
    color: AppColor.kColorBlack,
  ),
//? lable medium for hint text all  color only grey
  labelMedium: TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w200,
    color: AppColor.kColorGrey,
  ),
//? label small for date only
  labelSmall: TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w200,
    color: AppColor.kColorGrey,
  ),
);
