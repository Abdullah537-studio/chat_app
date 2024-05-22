import 'package:chat_2/core/strings/key_translate_manger.dart';
import 'package:chat_2/features/auth/presentation/widgets/custom_dropDownButton.dart';
import 'package:flutter/material.dart';

class CustomGenderDropDown extends StatelessWidget {
  final Function(int)? genderFunction;
  const CustomGenderDropDown({super.key, this.genderFunction});

  // void _ongenderChanged(int? gender, FormState formState) {
  //   genderFunction!(gender ?? 0);
  //   formState.validate();
  // }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>>? items = [
      DropdownMenuItem(value: "0", child: Text("Male")),
      DropdownMenuItem(value: "1", child: Text("Female"))
    ];

    return CustomDropdownButtonFormField(
      items: items,
      // ["Male", "Female"]
      //     .map(
      //         (String item) => DropdownMenuItem(value:item, child: Text(item)))
      //     .toList(),
      label: translating(context, AppKeyTranslateManger.gender),
      onChanged: (val) {
        int gender = int.parse(val!);
        // _ongenderChanged(gender, Form.of(context));
        genderFunction!(gender);
      },
    );
  }
}
