import 'package:chat_2/core/enum/gender_enum.dart';
import 'package:chat_2/core/strings/key_translate_manger.dart';
import 'package:chat_2/core/widget/main_dropDown_button.dart';
import 'package:flutter/material.dart';

class CustomGenderDropDown extends StatelessWidget {
  final Function(int)? genderFunction;
  const CustomGenderDropDown({super.key, this.genderFunction});
  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> items = Gender.values.map((gender) {
      return DropdownMenuItem(
        value: gender.index.toString(),
        child: Text(
          translating(
            context,
            AppKeyTranslateManger.genderKeys[gender] ?? '',
          ),
        ),
      );
    }).toList();

    return CustomDropdownButtonFormField(
      items: items,
      label: translating(context, AppKeyTranslateManger.gender),
      onChanged: (val) {
        int gender = int.parse(val ?? "0");
        genderFunction!(gender);
      },
    );
  }
}
