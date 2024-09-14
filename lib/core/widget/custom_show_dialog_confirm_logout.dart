import 'package:chat_2/core/shared/shared_pref.dart';
import 'package:chat_2/core/strings/route_named_screens_string.dart';
import 'package:flutter/material.dart';

showAlertDialogConfirmLogOut(BuildContext context) {
  // set up the buttons
  Widget cancelButton = MaterialButton(
    child: Text("Cancel"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = MaterialButton(
    child: Text("Continue"),
    onPressed: () {
      final String languageCode = AppSharedPreferences.getLanguageCode();
      AppSharedPreferences.clear();
      AppSharedPreferences.cacheLanguageCode(languageCode: languageCode);
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteNamedScreens.loginorSignScreenNameRoute,
        (Route<dynamic> route) => false,
      );
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Confirm Logout"),
    content: Text("Are you sure you want to log out of your account?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
