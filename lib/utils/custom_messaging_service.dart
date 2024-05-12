import '/utils/variables.dart';
import 'network.dart';
import 'preferences_manager.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class CustomMessagingService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  void configure() async {
    // Get the initial token
    String? initialToken = await _firebaseMessaging.getToken();
    print("Initial Token: $initialToken");
    handleToken(initialToken);

    // Triggered every time token is refreshed
    _firebaseMessaging.onTokenRefresh.listen((newToken) {
      print("New Token: $newToken");
      handleToken(newToken);
    });
  }

  Future<void> handleToken(String? token) async {
    print("handleToken");
    PreferencesManager.setFireBaseToken(token ?? "");
    bool isLoggedIn = await PreferencesManager.getIsLoggedIn();
    print(isLoggedIn);
    if (isLoggedIn == true) sendToServer(token);
  }

  sendToServer(String? token) async {
    var data = {
      "device_token": token,
    };
    try {
      await Network().addData(data, Variables.SET_FIRE_BASE_TOKEN);
    } catch (e) {
      print("My error: " + e.toString());
      return null;
    }
  }
}
