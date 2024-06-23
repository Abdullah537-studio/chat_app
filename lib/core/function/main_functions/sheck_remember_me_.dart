import 'package:chat_2/core/shared/shared_pref.dart';
import 'package:chat_2/core/strings/route_named_screens_string.dart';
import 'package:flutter/material.dart';

sheckRememberMeToNavigatorAndGiveTimber(BuildContext context) {
  Future.delayed(
    const Duration(seconds: 3),
    () async {
      if (AppSharedPreferences.getRememberMeValue()) {
        Navigator.pushReplacementNamed(
          context,
          RouteNamedScreens.boottomTabBarScreenNameRoute,
        );
      } else {
        Navigator.pushReplacementNamed(
          context,
          RouteNamedScreens.loginorSignScreenNameRoute,
        );
      }
    },
  );
}
