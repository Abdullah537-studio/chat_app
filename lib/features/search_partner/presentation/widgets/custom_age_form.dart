import 'package:chat_2/core/strings/key_translate_manger.dart';
import 'package:chat_2/core/widget/custom_text_form_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAge extends StatelessWidget {
  final String text;
  final Function(int?)? getAge;
  final String? Function(String?)? validate;
  const CustomAge({
    super.key,
    required this.text,
    required this.getAge,
    required this.validate,
  });

  // void _onAgeChanged(int? age, FormState formState) {
  //   getAge!(age);
  //   formState.validate();
  // }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 145.w,
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        SizedBox(
          width: 157.w,
          height: 75.h,
          child: CustomTextFormFiled(
            validate: validate,
            keyboardTybe: TextInputType.number,
            showPassword: false,
            hintText: translating(context, AppKeyTranslateManger.age),
            onChange: (value) {
              if (value != null && value.length > 1) {
                int age = int.parse(value);
                getAge!(age);

                // _onAgeChanged(
                //   age,
                //   Form.of(context),
                // );
              }
            },
          ),
        )
      ],
    );
  }
}
