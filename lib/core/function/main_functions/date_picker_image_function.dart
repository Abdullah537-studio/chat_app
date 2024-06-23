//?------------method show date picker ------------------------------------------

import 'package:flutter/material.dart';

Future<void> selectDate(
    BuildContext context, TextEditingController controller) async {
  DateTime? selectedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
  );
  if (selectedDate != null) {
    controller.text =
        selectedDate.toString().substring(0, 10).replaceAll("-", "/");
  }
}
