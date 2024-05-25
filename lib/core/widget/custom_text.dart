import 'package:chat_2/core/strings/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//? body medium text black always
class CustomTextWidget {
  static Widget textTitleLarge(String text, BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.titleLarge);
  }

  static Widget textTitleMedium(String text, BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.titleMedium);
  }

  static Widget textTitleSmall(String text, BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.titleSmall);
  }

  static Widget textBodyLarge(String text, BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.bodyLarge);
  }

  static Widget textBodyMedium(String text, BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.bodyMedium);
  }

  static Widget textBodySmall(String text, BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.bodySmall);
  }

  static Widget textLabelLagre(String text, BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.labelLarge);
  }

  static Widget textLabelMedium(String text, BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.labelMedium);
  }

  static Widget textLabelSmall(String text, BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.labelSmall);
  }

  static Widget textkPrimaryColor(String text, BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(color: AppColor.kPrimaryColor),
    );
  }

  static Widget textBlackColorBigThanMedium(String text, BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 22.sp,
          color: AppColor.kColorBlack,
          fontWeight: FontWeight.w500),
    );
  }
}
