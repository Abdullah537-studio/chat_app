import 'package:chat_2/core/function/firebase_functions/background_function.dart';
import 'package:chat_2/core/function/firebase_functions/foreground_function.dart';
import 'package:chat_2/core/function/main_functions/get_permission_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

doFunctionFirebaseNotification() async {
  await Firebase.initializeApp();
  GetPermissionMessaging();
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  FirebaseMessaging.onMessage.listen(firebaseMessagingForegroundHandler);
}
