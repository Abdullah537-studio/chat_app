import 'package:chat_2/core/strings/key_translate_manger.dart';
import 'package:chat_2/features/auth/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';

class validationAll {
  BuildContext context;
  validationAll({required this.context});

//!--------- function validate
//? ------------------- validate generall

  String? validateGenerall(String? val) {
    if (val?.isEmpty ?? false) {
      return translating(
        context,
        AppKeyTranslateManger.field_empty_validate,
      );
    }
    return null;
  }

//? ------------------- validate generall

  String? validateAgeNumber(String? val) {
    if (val?.isEmpty ?? false) {
      return translating(
        context,
        AppKeyTranslateManger.field_empty_validate,
      );
    } else if (val?.contains(",") ?? false || val!.contains(".")) {
      return translating(
        context,
        AppKeyTranslateManger.validate_only_number,
      );
    } else if (int.parse(val ?? "0") < 12 || int.parse(val ?? "0") > 100) {
      return translating(
        context,
        AppKeyTranslateManger.age_under_12_above_100_not_currect,
      );
    }
    return null;
  }

//? ------------------- dropdown

  String? validateDropdown(String? val) {
    if (val == null) {
      return translating(
        context,
        AppKeyTranslateManger.field_empty_validate,
      );
    }
    return null;
  }

//? ------------------- email

  String? validateEmail(String? val) {
    if (val?.isEmpty ?? true) {
      return translating(
        context,
        AppKeyTranslateManger.field_empty_validate,
      );
    } else if (val?.contains(".com") == false) {
      return translating(
        context,
        AppKeyTranslateManger.email_not_currect,
      );
    }
    return null;
  }

//? ------------------- password
  String? validatePassword(String? val) {
    bool isValidString(String input) {
      final RegExp regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$');
      return regex.hasMatch(input);
    }

    if (val?.isEmpty ?? true) {
      return translating(
        context,
        AppKeyTranslateManger.field_empty_validate,
      );
    } else if (isValidString(val ?? "") == false) {
      return translating(
        context,
        AppKeyTranslateManger.passwod_not_word_currect,
      );
    } else if (val != null && val.length < 8) {
      return translating(
        context,
        AppKeyTranslateManger.passwod_not_length_currect,
      );
    }
    return null;
  }

//? ------------------- reenter password
  String? validateReenterPassword(String? val) {
    bool isValidString(String input) {
      final RegExp regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$');
      return regex.hasMatch(input);
    }

    if (val?.isEmpty ?? true) {
      return translating(
        context,
        AppKeyTranslateManger.field_empty_validate,
      );
    } else if (isValidString(val ?? "") == false) {
      return translating(
        context,
        AppKeyTranslateManger.passwod_not_word_currect,
      );
    } else if (val != ModalValidate.passwordToValidate) {
      return translating(
        context,
        AppKeyTranslateManger.reenter_password_not_currrect,
      );
    }
    return null;
  }

//? ------------------- phone number
  String? validatePhoneNumber(String? val) {
    if (val?.isEmpty ?? true) {
      return translating(
        context,
        AppKeyTranslateManger.field_empty_validate,
      );
    } else if (val != null && val.startsWith("+963") == true) {
      return translating(
        context,
        AppKeyTranslateManger.phone_number_not_currect,
      );
    } else if (val?.length != 13) {
      return translating(context, AppKeyTranslateManger.phone_lenght_validator);
    }
    return null;
  }

//? -------------------to do validate for age

  String? validateNumberMinAgeFindPartner(String? val) {
    if (val?.isEmpty ?? true) {
      return translating(
        context,
        AppKeyTranslateManger.field_empty_validate,
      );
    } else if (val?.contains(",") ?? false || val!.contains(".")) {
      return translating(
        context,
        AppKeyTranslateManger.validate_only_number,
      );
    } else if (int.parse(val ?? "0") < 12 || int.parse(val ?? "0") > 100) {
      return translating(
        context,
        AppKeyTranslateManger.age_under_12_above_100_not_currect,
      );
    } else if (int.parse(val ?? "0") == ModalValidate.maxAge ||
        int.parse(val ?? "0") < ModalValidate.maxAge) {
      return translating(
        context,
        AppKeyTranslateManger.min_age_not_currect,
      );
    }
    return null;
  }

  String? validateNumberMaxAgeFindPartner(String? val) {
    if (val?.isEmpty ?? false) {
      return translating(
        context,
        AppKeyTranslateManger.field_empty_validate,
      );
    } else if (int.parse(val ?? "0") > 99 || int.parse(val ?? "0") < 12) {
      return translating(
        context,
        AppKeyTranslateManger.age_under_12_above_100_not_currect,
      );
    } else if (val?.contains(",") ?? false || val!.contains(".")) {
      return translating(
        context,
        AppKeyTranslateManger.validate_only_number,
      );
    } else if (int.parse(val ?? "0") < ModalValidate.minAge) {
      return translating(
        context,
        AppKeyTranslateManger.max_age_not_currect,
      );
    }
    return null;
  }
}
