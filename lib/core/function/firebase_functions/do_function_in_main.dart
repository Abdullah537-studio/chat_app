import 'package:chat_2/core/function/firebase_functions/background_function.dart';
import 'package:chat_2/core/function/firebase_functions/foreground_function.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

//! to get functions from firebase https://firebase.google.com/docs/cloud-messaging/flutter/receive#handle-message-data
doFunctionFirebaseNotification() async {
  await Firebase.initializeApp();
  //? permission
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('User granted provisional permission');
  } else {
    print('User declined or has not accepted permission');
  }
  //? terminated message handler
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  //? background message handler
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  //? foreground message handler
  FirebaseMessaging.onMessage.listen(firebaseMessagingForegroundHandler);
}
