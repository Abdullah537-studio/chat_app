// ignore_for_file: must_be_immutable

import 'package:chat_2/core/strings/color_manager.dart';
import 'package:chat_2/generate/theme/custom_outline_input_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormFiled extends StatelessWidget {
  CustomTextFormFiled({
    super.key,
    required this.validate,
    required this.onChange,
    required this.hintText,
    this.icon,
    this.onPressedIcon,
    required this.keyboardTybe,
    required this.showPassword,
    this.onEdithingComplete,
  });
  final String? Function(String?)? validate;
  final Function(String?)? onChange;
  final String hintText;
  Icon? icon;
  Function()? onPressedIcon;
  final TextInputType? keyboardTybe;
  final bool showPassword;
  Function()? onEdithingComplete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h, left: 40.w, right: 40.w),
      child: TextFormField(
        decoration: InputDecoration(
          hintStyle: Theme.of(context).textTheme.labelMedium,
          hintText: hintText,
          focusedBorder: outlineInputBorder(AppColor.kPrimaryColor),
          errorBorder: outlineInputBorder(AppColor.kErroreBorderColor),
          focusedErrorBorder:
              outlineInputBorder(AppColor.kErroreFoucaseBorderColor),
          enabledBorder: outlineInputBorder(AppColor.kColorBlack),
        ),
        onEditingComplete: onEdithingComplete,
        textInputAction: TextInputAction.next,
        cursorColor: AppColor.kPrimaryColor,
        obscureText: showPassword,
        obscuringCharacter: "⋆",
        style: Theme.of(context).textTheme.bodyMedium,
        keyboardType: keyboardTybe,
        validator: validate,
        onChanged: onChange,
      ),
    );
  }
}
