import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Handle the background notification here
  // For example, you can update the user interface or store data
  print('Received background message: ${message.messageId}');
}
