import 'package:chat_2/core/function/firebase_functions/do_function_in_main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/my_app.dart';
import 'core/shared/shared_pref.dart';
import 'injection/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  doFunctionFirebaseNotification();
  SharedPreferences.getInstance().then(
    (prefs) {
      AppSharedPreferences.init(prefs);
      runApp(MyApp());
    },
  );
}
