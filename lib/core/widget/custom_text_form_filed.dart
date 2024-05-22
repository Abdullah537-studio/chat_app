// ignore_for_file: must_be_immutable

import 'package:chat_2/core/strings/color_manager.dart';
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
  });
  final String? Function(String?)? validate;
  final Function(String?)? onChange;
  final String hintText;
  Icon? icon;
  Function()? onPressedIcon;
  final TextInputType? keyboardTybe;
  final bool showPassword;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h, left: 10.w, right: 10.w),
      child: TextFormField(
          textInputAction: TextInputAction.next,
          cursorColor: AppColor.kPrimaryColor,
          obscureText: showPassword,
          obscuringCharacter: "⋆",
          style: Theme.of(context).textTheme.bodyMedium,
          keyboardType: keyboardTybe,
          validator: validate,
          decoration: InputDecoration(
            isDense: true,
            contentPadding:
                EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.labelMedium,
            suffixIcon: icon,
          ),
          onChanged: onChange),
    );
  }
}
