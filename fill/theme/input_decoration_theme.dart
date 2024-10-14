import 'package:chat_2/core/strings/color_manager.dart';
import 'package:chat_2/generate/theme/custom_outline_input_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

InputDecorationTheme? custominputDecorationTheme = InputDecorationTheme(
  hintStyle: TextStyle(color: AppColor.kColorGrey, fontSize: 20.sp),
  errorBorder: outlineInputBorder(AppColor.kErroreBorderColor),
  enabledBorder: outlineInputBorder(AppColor.kColorBlack),
  focusedBorder: outlineInputBorder(AppColor.kPrimaryColor),
  focusedErrorBorder: outlineInputBorder(AppColor.kErroreBorderColor),
  suffixIconColor: AppColor.iconColorGrey,
  contentPadding: EdgeInsets.only(
    top: 25.h,
    bottom: 25.h,
    right: 20.w,
    left: 20.w,
  ),
);
