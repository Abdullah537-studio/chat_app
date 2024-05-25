// ignore_for_file: deprecated_member_use

import 'package:chat_2/core/function/date_picker_image_function.dart';
import 'package:chat_2/core/function/validator.dart';
import 'package:chat_2/core/strings/color_manager.dart';
import 'package:chat_2/core/strings/image_svg.dart';
import 'package:chat_2/core/strings/key_translate_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomFormDate extends StatelessWidget {
  const CustomFormDate({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: GestureDetector(
        onTap: () {
          //! this method get date  in core
          selectDate(context, controller);
        },
        child: TextFormField(
          validator: validationAll.validateGenerall,
          style: Theme.of(context).textTheme.bodyMedium,
          controller: controller,
          enabled: false,
          decoration: InputDecoration(
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(width: 2.w)),
            contentPadding:
                EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            isDense: true,
            hintText:
                translating(context, AppKeyTranslateManger.date_form_search),
            hintStyle: Theme.of(context).textTheme.labelMedium,
            suffixIcon: Tab(
              child: SvgPicture.asset(
                calenderIcondate,
                color: AppColor.kColorBlack,
                height: 25.h,
                width: 25.w,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
