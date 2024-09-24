import 'package:chat_2/core/enum/tab_bar_state.dart';
import 'package:chat_2/core/shared/shared_pref.dart';
import 'package:chat_2/core/strings/key_translate_manger.dart';
import 'package:chat_2/core/strings/route_named_screens_string.dart';
import 'package:flutter/material.dart';

showAlertDialogConfirmLogOut(BuildContext context) {
  // set up the buttons
  Widget cancelButton = MaterialButton(
    child: Text(
      translating(context, AppKeyTranslateManger.confirm_logout_bottom_cancle),
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = MaterialButton(
    child: Text(
      translating(
          context, AppKeyTranslateManger.confirm_logout_bottom_continue),
    ),
    onPressed: () {
      bodyTabBardestination = TabBarStatus.home;
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
    title: Text(
      translating(context, AppKeyTranslateManger.confirm_logout_title),
    ),
    content: Text(
      translating(context, AppKeyTranslateManger.confirm_logout_body),
    ),
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
