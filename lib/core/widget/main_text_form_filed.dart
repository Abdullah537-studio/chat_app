// ignore_for_file: must_be_immutable

import 'package:chat_2/core/strings/color_manager.dart';
import 'package:chat_2/generate/theme/custom_outline_input_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainTextFormField extends StatelessWidget {
  MainTextFormField(
      {super.key,
      this.maxLength,
      required this.textInputFormatter,
      required this.validate,
      required this.onChange,
      required this.hintText,
      this.icon,
      this.onPressedIcon,
      required this.keyboardTybe,
      required this.showPassword,
      this.onEdithingComplete,
      this.thisIsPassword});
  bool? thisIsPassword = false;
  final String? Function(String?)? validate;
  int? maxLength;
  final Function(String?)? onChange;
  final String hintText;
  Icon? icon;
  Function()? onPressedIcon;
  final TextInputType? keyboardTybe;
  bool showPassword;
  Widget? iconKeyShowPassord;
  Function()? onEdithingComplete;
  final List<TextInputFormatter>? textInputFormatter;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: StatefulBuilder(
        builder: (BuildContext context, setState) {
          if (thisIsPassword == true) {
            if (showPassword == false) {
              icon = Icon(Icons.vpn_key_off);
            } else {
              icon = Icon(Icons.vpn_key_rounded);
            }
          }
          return TextFormField(
            maxLength: maxLength,
            inputFormatters: textInputFormatter,
            decoration: InputDecoration(
              suffixIconColor: AppColor.iconColorGrey,
              suffixIcon: thisIsPassword == true
                  ? GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            if (showPassword == true) {
                              showPassword = false;
                            } else {
                              showPassword = true;
                            }
                          },
                        );
                      },
                      child: icon,
                    )
                  : icon,
              hintStyle: Theme.of(context).textTheme.labelMedium,
              hintText: hintText,
              focusedBorder: outlineInputBorder(AppColor.kPrimaryColor),
              errorBorder: outlineInputBorder(AppColor.kErroreBorderColor),
              focusedErrorBorder:
                  outlineInputBorder(AppColor.kErroreBorderColor),
              enabledBorder: outlineInputBorder(AppColor.kColorBlack),
            ),
            onEditingComplete: onEdithingComplete,
            textInputAction: TextInputAction.next,
            cursorColor: AppColor.kPrimaryColor,

            obscureText: showPassword,
            obscuringCharacter: "⋆",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColor.iconColorGrey),
            keyboardType: keyboardTybe,
            validator: validate,
            onChanged: onChange,
          );
        },
      ),
    );
  }
}
