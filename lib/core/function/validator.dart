class validationAll {
//!--------- variable to compare and give validate
  static int minAge = 0;
  static int maxAge = 0;
  static String? passwordValidate;
//!--------- function validate
//? ------------------- validate generall

  static String? validateGenerall(String? val) {
    if (val!.isEmpty) {
      return "this field is reqiured";
    }
    return null;
  }

//? ------------------- dropdown

  static String? validateDropdown(String? val) {
    if (val == null) {
      return "this field is required";
    }
    return null;
  }

//? ------------------- email

  static String? validateEmail(String? val) {
    if (val!.isEmpty) {
      return "this field is reqiured";
    } else if (!val.contains(".com")) {
      return "your email is not correct !! , must have @ ___ .com";
    }
    return null;
  }

//? ------------------- password
  static String? validatePassword(String? val) {
    if (val!.isEmpty) {
      return "this field is reqiured";
    } else if (!(val.contains(RegExp(r'[A-Z]')) &&
        val.contains(RegExp(r'[a-z]')))) {
      return "The password should contain both uppercase and lowercase letters.";
    } else if ((val.length < 8)) {
      return "password should be above 8 word.";
    }
    return null;
  }

//? ------------------- reenter password
  static String? validateReenterPassword(String? val) {
    if (val!.isEmpty) {
      return "this field is reqiured";
    } else if (val != passwordValidate) {
      return "must reenter same password !!";
    }
    return null;
  }

//? ------------------- phone number
  static String? validatePhoneNumber(String? val) {
    if (val!.isEmpty) {
      return "this field is required";
    } else if (val.startsWith("+963") == false) {
      return "phone number must start +963";
    }
    return null;
  }

//? -------------------to do validate for age

  static String? validateNumberMinAgeFindPartner(String? val) {
    if (val!.isEmpty) {
      return "this field is required";
    } else if (int.parse(val) < 12) {
      return "age must be between 12:100";
    } else if (int.parse(val) >= maxAge) {
      return "minAge lest than maxAge !!";
    }
    return null;
  }

  static String? validateNumberMaxAgeFindPartner(String? val) {
    if (val!.isEmpty) {
      return "this field is reqiured";
    } else if (int.parse(val) > 99) {
      return "age must be above 12 and under 100 year ";
    } else if (int.parse(val) <= minAge) {
      return "maxAge > minAge !!";
    }
    return null;
  }
}
