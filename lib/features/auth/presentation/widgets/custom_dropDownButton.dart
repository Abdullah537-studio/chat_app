// ignore_for_file: library_private_types_in_public_api, file_names, must_be_immutable, deprecated_member_use
import 'package:chat_2/core/function/validator.dart';
import 'package:chat_2/core/strings/color_manager.dart';
import 'package:chat_2/core/strings/image_svg.dart';
import 'package:chat_2/core/widget/main_text_widget.dart';
import 'package:chat_2/generate/theme/custom_outline_input_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDropdownButtonFormField extends StatefulWidget {
  List<DropdownMenuItem<String>>? items;
  Color? colorIcon;

  final Function(String?) onChanged;
  final String label;
  CustomDropdownButtonFormField({
    super.key,
    required this.onChanged,
    required this.items,
    required this.label,
  });

  // ...

  @override
  _CustomDropdownButtonFormFieldState createState() =>
      _CustomDropdownButtonFormFieldState();
}

String? selectedValue;

class _CustomDropdownButtonFormFieldState
    extends State<CustomDropdownButtonFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h, left: 30.w, right: 30.w),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField2<String>(
          onMenuStateChange: (isOpen) {
            print("isOpen");

            setState(() {
              if (isOpen == true) {
                widget.colorIcon = AppColor.kPrimaryColor;
              } else {
                widget.colorIcon = AppColor.kColorBlack;
              }
            });
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
                top: 25.h, bottom: 25.h, right: 20.w, left: 5.w),
            hintStyle: Theme.of(context).textTheme.labelMedium,
            hintText: widget.label,
            focusedBorder: outlineInputBorder(AppColor.kPrimaryColor),
            errorBorder: outlineInputBorder(AppColor.kErroreBorderColor),
            focusedErrorBorder:
                outlineInputBorder(AppColor.kErroreFoucaseBorderColor),
            enabledBorder: outlineInputBorder(AppColor.kColorBlack),
          ),
          validator: validationAll(context: context).validateDropdown,
          isExpanded: true,
          iconStyleData: IconStyleData(
            // iconSize: 33,
            icon: Tab(
              child: SvgPicture.asset(
                arrowDown,
                color: widget.colorIcon,
              ),
            ),
          ),
          style: Theme.of(context).textTheme.bodyMedium,
          dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                color: AppColor.kSecondaryColor,
                border: Border.all(color: AppColor.kPrimaryColor, width: 2.w),
                borderRadius: BorderRadius.circular(10.r),
              ),
              maxHeight: 200.h,
              offset: Offset(0.w, -5.h)),
          hint: MainTextWidget(
            text: widget.label,
            style: Theme.of(context).textTheme.labelMedium!,
            isCenter: false,
          ),
          items: widget.items,
          value: selectedValue,
          onChanged: widget.onChanged,
        ),
      ),
    );
  }
}
