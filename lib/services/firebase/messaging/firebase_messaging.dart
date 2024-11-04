import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

class MessagingFirebase {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      await _firebaseMessaging.getToken();
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {

        if (message.notification != null) {

        }
        FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
      });
    }
  }

  Future<String?> getToken() async{
    return await _firebaseMessaging.getToken();
  }
}
