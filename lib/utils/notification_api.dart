import 'dart:convert';
import 'package:applanguefront/screens/auth/login_screen.dart';
import 'package:applanguefront/utils/preferences_manager.dart';
import 'package:applanguefront/view/auth/login_screen.dart';
import 'package:applanguefront/view/auth/second_Screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import '../model/order.dart';
import '../screens/payment_options_screen.dart';

class NotificationApi {
  static final _notification = FlutterLocalNotificationsPlugin();
  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;

  static void init(BuildContext context) {
    _notification.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
     //   iOS: DarwinInitializationSettings(),
      ),
    );

    void showLocalNotification(String title, String body) async {
      var androidDetails = const AndroidNotificationDetails(
        'channelId',
        'channelName',
        importance: Importance.max,
        priority: Priority.high,

      );
     // var iOSDetails = const DarwinNotificationDetails();
      var generalNotificationDetails =
          NotificationDetails(android: androidDetails);

      await _notification.show(0, title, body, generalNotificationDetails);
    }

    // Foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("onMessage.listen data:");

      // Display a local notification when the app is in foreground
      showLocalNotification(
          message.notification?.title ?? '', message.notification?.body ?? '');

      if (message.data.containsKey('type') &&
          (message.data['type']) == "REQUEST_ACCEPTED") {
        print("REQUEST_ACCEPTED");
        Map<String, dynamic> orderMap = json.decode(message.data['order']);
        // print(orderMap);
        print('Provider type: ${orderMap['provider'].runtimeType}');
        print('Provider content: ${orderMap['provider']}');

        Order order = Order.fromJson(orderMap);
        PreferencesManager.setIsRequestAccepted(true);
        Get.to(() => SecondScreen());

        // App is in the foreground, show the dialog
        // _showNotificationDialog(context, message.notification?.title ?? '',
        //     message.notification?.body ?? '', orderId);
      }
    });

    // Handle the notification caused by tapping on it in the system tray
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("onMessageOpenedApp.listen data:");
      if (message.data.containsKey('type') &&
          (message.data['type']) == "REQUEST_ACCEPTED") {
        print("REQUEST_ACCEPTED");
        Map<String, dynamic> orderMap = json.decode(message.data['order']);
        Order order = Order.fromJson(orderMap);
        PreferencesManager.setIsRequestAccepted(true);
        Get.to(() => SecondScreen());

        // App is in the foreground, show the dialog
        // _showNotificationDialog(context, message.notification?.title ?? '',
        //     message.notification?.body ?? '', orderId);
      } else {
        // Navigate or perform the desired action
        // For now, let's just print the payload
        Get.to(LoginPage());
      }

      print("Opened from Notification: ${message.data['payload']}");
    });

    // Handle the case where the app was terminated and then launched by tapping a notification
    _firebaseMessaging.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        if (message.data.containsKey('type') &&
            (message.data['type']) == "REQUEST_ACCEPTED") {
          print("REQUEST_ACCEPTED");
          Map<String, dynamic> orderMap = json.decode(message.data['order']);
          Order order = Order.fromJson(orderMap);
          PreferencesManager.setIsRequestAccepted(true);
          Get.to(() => SecondScreen());
        } else {
          // Navigate or perform the desired action
          Get.to(LoginScreen());
          // For now, let's just print the payload
          print("App Launched from Notification: ${message.data['payload']}");
        }
      }
    });
  }
}
