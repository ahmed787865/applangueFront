import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import '../../model/order.dart';
import '../../screens/payment_options_screen.dart';
import '../../utils/app_logger.dart';
import '../api/api_list.dart';
import '../api/api_service.dart';
import '../services.dart';
import '../storage/storage_service.dart';
import 'firebase_options.dart';

class FirebaseService extends GetxService implements BaseService {
  static get() => Get.find<FirebaseService>();
  static final _notification = FlutterLocalNotificationsPlugin();

  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  final bool _fcmEnabled = StorageService.get().fcmEnabled ?? false;
  late String _fcmToken;

  String get fcmToken => _fcmToken;

  @override
  Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    _notification.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        //iOS: DarwinInitializationSettings(),
      ),
    );

    // Foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.data.containsKey('type') &&
          (message.data['type']) == "REQUEST_ACCEPTED") {
        Map<String, dynamic> orderMap = json.decode(message.data['order']);
        Order order = Order.fromJson(orderMap);
        _showNotificationDialog(
            message.notification!.title!, message.notification!.title!, order);
        Get.off(() => PaymentOptionsScreen(
         // order: order,
        ));
      } else if (message.data.containsKey('type') &&
          (message.data['type']) == "CONFIRM_PAYMENT") {
        Map<String, dynamic> orderMap = json.decode(message.data['order']);
        Order order = Order.fromJson(orderMap);
        // Get.off(() => ClientContactScreen(
        //       order: order,
        //     ));
      } else {
        // Display a local notification when the app is in foreground
        _showLocalNotification(message.notification?.title ?? '',
            message.notification?.body ?? '');
      }
    });

    // Handle the notification caused by tapping on it in the system tray
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.data.containsKey('type') &&
          (message.data['type']) == "ORDER_REQUEST") {
        Map<String, dynamic> orderMap = json.decode(message.data['order']);
        Order order = Order.fromJson(orderMap);

        // App is in the foreground, show the dialog
        _showNotificationDialog(message.notification?.title ?? '',
            message.notification?.body ?? '', order);
      } else {
        // Navigate or perform the desired action
        // For now, let's just print the payload
        // Get.to(DashboardScreen());
      }
    });

    // Handle the case where the app was terminated and then launched by tapping a notification
    messaging.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        if (message.data.containsKey('type') &&
            (message.data['type']) == "ORDER_REQUEST") {
          Map<String, dynamic> orderMap = json.decode(message.data['order']);
           Order order = Order.fromJson(orderMap);

          // App is in the foreground, show the dialog
          _showNotificationDialog(message.notification?.title ?? '',
              message.notification?.body ?? '', order);
        } else {
          // Display a local notification when the app is in foreground
          _showLocalNotification(message.notification?.title ?? '',
              message.notification?.body ?? '');
        }
      }
    });

    messaging.requestPermission();
  }

  static Future<String?> _getFCMToken() async {
    return await messaging.getToken();
  }

  static void _onTokenRefresh(String token) {
    _handleToken(token);
  }

  static void _handleToken(String token) async {
    final storageService = Get.find<StorageService>();
    if (storageService.isLoggedIn ?? false) {
      sendToServer(token);
    }
    storageService.fcmToken = token;
  }

  /// --- notifications ---
  Future<void> initFCM() async {
    if (_fcmEnabled) return;
    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    messaging.onTokenRefresh.listen(_onTokenRefresh);
    String? initialToken = await _getFCMToken();

    if (initialToken != null) {
      log.i("Firebase Token: $initialToken");
      _handleToken(initialToken);
    } else {
      log.e("Could Not get FCM Token, please check your internet connection");
    }
  }

  static Future<void> sendToServer(String? token) async {
    var data = {
      "device_token": token,
    };

    final response = await ApiService.get().postRequest(
        url: ApiList.SET_FIRE_BASE_TOKEN,
        data: data,
        converter: (response) {});
    response.fold(
            (l) => log.e("Error while sending to token $l"),
            (r) => StorageService.get().fcmEnabled = true
    );

  }

  static void _showNotificationDialog(String title, String body, Order order) {
    // Get.dialog(
    //     barrierDismissible: false,
    //     NotificationDialog(title: title, body: body, order: order)
    // );
  }

  static void _showLocalNotification(String title, String body) async {
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
}
