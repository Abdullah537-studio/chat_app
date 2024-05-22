// ignore_for_file: library_private_types_in_public_api, file_names, must_be_immutable
import 'package:chat_2/core/function/validator.dart';
import 'package:chat_2/core/strings/color_manager.dart';
import 'package:chat_2/core/strings/image_svg.dart';
import 'package:chat_2/core/widget/custom_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDropdownButtonFormField extends StatefulWidget {
  List<DropdownMenuItem<String>>? items;
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
      padding: EdgeInsets.only(bottom: 10.h, left: 10.w, right: 10.w),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField2<String>(
          validator: validationAll.validateDropdown,
          isExpanded: true,
          iconStyleData: IconStyleData(
            // iconSize: 33,
            icon: Tab(
              child: SvgPicture.asset(
                arrowDown,
              ),
            ),
          ),
          style: Theme.of(context).textTheme.bodyMedium,
          dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                color: AppColor.kSecondaryColor,
                border: Border.all(color: AppColor.kPrimaryColor),
                borderRadius: BorderRadius.circular(10.r),
              ),
              maxHeight: 200.h,
              offset: Offset(0.w, -5.h)),

          hint: CustomTextWidget.textLabelMedium(widget.label, context),

          items: widget.items,
          value: selectedValue,
          onChanged: widget.onChanged,
          // buttonStyleData: ButtonStyleData(
          //   width: 20,
          //   height: 50.h,
          //   padding: EdgeInsets.all(0),
          // ),
          // isDense: true,
        ),
      ),
    );
  }
}
