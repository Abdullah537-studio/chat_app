import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> firebaseMessagingForegroundHandler(RemoteMessage message) async {
  // Handle the foreground notification here
  // For example, you can display the notification to the user or update the user interface
  print('Received foreground message: ${message.messageId}');
}
