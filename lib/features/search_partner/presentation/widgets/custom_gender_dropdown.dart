import 'package:chat_2/core/strings/key_translate_manger.dart';
import 'package:chat_2/features/auth/presentation/widgets/custom_dropDownButton.dart';
import 'package:flutter/material.dart';

class CustomGenderDropDown extends StatelessWidget {
  final Function(int)? genderFunction;
  const CustomGenderDropDown({super.key, this.genderFunction});

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>>? items = [
      DropdownMenuItem(
          value: "0",
          child: Text(translating(context, AppKeyTranslateManger.male))),
      DropdownMenuItem(
          value: "1",
          child: Text(translating(context, AppKeyTranslateManger.female)))
    ];

    return CustomDropdownButtonFormField(
      items: items,
      label: translating(context, AppKeyTranslateManger.gender),
      onChanged: (val) {
        int gender = int.parse(val!);
        genderFunction!(gender);
      },
    );
  }
}
