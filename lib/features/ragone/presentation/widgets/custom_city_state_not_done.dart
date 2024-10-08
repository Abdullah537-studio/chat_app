// ignore_for_file: deprecated_member_use

import 'package:chat_2/core/function/main_functions/validator.dart';
import 'package:chat_2/core/strings/color_manager.dart';
import 'package:chat_2/core/strings/image_svg.dart';
import 'package:chat_2/generate/theme/custom_outline_input_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomCityStateIsNotDone extends StatelessWidget {
  const CustomCityStateIsNotDone({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: TextFormField(
        enabled: false,
        style: Theme.of(context).textTheme.bodyMedium,
        validator: validationAll(context: context).validateGenerall,
        decoration: InputDecoration(
          disabledBorder: outlineInputBorder(AppColor.kColorBlack),
          hintText: text,
          alignLabelWithHint: false,
          hintStyle: Theme.of(context).textTheme.labelMedium,
          contentPadding: EdgeInsetsDirectional.only(
            start: 25.w,
            top: 25.h,
            bottom: 25.h,
            end: 20.w,
          ),
          suffixIcon: Tab(
            child: SvgPicture.asset(
              arrowDown,
              color: AppColor.kColorBlack,
            ),
          ),
        ),
      ),
    );
  }
}
