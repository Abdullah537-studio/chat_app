import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> firebaseMessagingTerminatedHandler(RemoteMessage message) async {
  // Handle the terminated notification here
  // For example, you can display the notification to the user or update the user interface
  print('Received terminated message: ${message.messageId}');
}
