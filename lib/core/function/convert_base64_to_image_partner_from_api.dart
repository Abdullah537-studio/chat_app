//! method convert base64 to image
import 'dart:convert';

import 'package:chat_2/core/shared/shared_pref.dart';
import 'package:chat_2/core/strings/image_png.dart';
import 'package:chat_2/features/auth/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//* ---- part image cutting
String partImageCut = '';

Widget imageFromBase64String(String base64String) {
  if (SignUpPage.userNameForImage == AppSharedPreferences.getUserName()) {
    String fullbase64String = partImageCut + base64String;
    return Image.memory(base64Decode(fullbase64String));
  } else {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 28.h,
        horizontal: 25.h,
      ),
      child: Image.asset(
        AppImageStringPng.imageNotFoundPng,
      ),
    );
  }
}
