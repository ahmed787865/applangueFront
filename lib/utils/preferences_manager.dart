import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/order.dart';
import '../model/provider.dart';



class PreferencesManager {
  // auth
  static const String userName = 'USER_NAME';
  static const String phoneNumber = 'PHONE_NUMBER';
  static const String whatsapp = 'WHATSAPP';
  static const String password = 'PASSWORD';
  static const String authToken = 'AUTH_TOKEN';
  static const String fireBaseToken = 'FIRE_BASE_TOKEN';
  static const String userType = 'USER_TYPE';
  static const String verificationCode = 'VERIFICATION_CODE';
  static const String isLoggedIn = "IS_LOGGED_IN";
  static const String isForgotPassword = "IS_FORGOT_PASSWORD";
  static const String isRequestProviderWhileGuest =
      "IS_RESQUEST_PROVIDER_WHILE_GUEST";
  static const String isWaitingForVerificationCode =
      'WAITING_FOR_VERIFICATION_CODE';
  static const String orderKey = "ORDER";
  static const String isRequestAccepted = "IS_REQUEST_ACCEPTED";
  static const String paymentMode = 'PAYMENT_MODE';
  static const String isWaitingForProvider = "IS_WAITING_FOR_PROVIDER";
  static const String providerKey = 'PROVIDER_KEY';
  static const String screenPreventLock = 'SCREEN_PREVENT_LOOK_KEY';

  static Future<String> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(userName) ?? "";
  }

  static setUserName(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(userName, value);
  }

  static Future<String> getPhoneNumber() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(phoneNumber) ?? "";
  }

  static setPhoneNumber(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(phoneNumber, value);
  }

  static Future<String> getWhatsapp() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(whatsapp) ?? "";
  }

  static setWhatsapp(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(whatsapp, value);
  }

  static Future<String> getPassword() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(password) ?? "";
  }

  static setPassword(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(password, value);
  }

  static Future<String> getAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(authToken) ?? "";
  }

  static setAuthToken(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(authToken, value);
  }

  static Future<String> getFireBaseToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(fireBaseToken) ?? "";
  }

  static setFireBaseToken(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(fireBaseToken, value);
  }

  static Future<String> getUserType() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(userType) ?? "";
  }

  static setUserType(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(userType, value);
  }

  static Future<String> getVerificationCode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(verificationCode) ?? "";
  }

  static setVerificationCode(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(verificationCode, value);
  }

  static Future<bool> getIsRequestAccepted() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isRequestAccepted) ?? false;
  }

  static setIsRequestAccepted(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isRequestAccepted, value);
  }

  static Future<bool> getIsWaitingForVerificationCode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isWaitingForVerificationCode) ?? false;
  }

  static setIsWaitingForVerificationCode(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isWaitingForVerificationCode, value);
  }

  static Future<bool> getIsLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isLoggedIn) ?? false;
  }

  static setIsLoggedIn(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isLoggedIn, value);
  }

  static Future<bool> getIsForgotPassword() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isForgotPassword) ?? false;
  }

  static setIsForgotPassword(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isForgotPassword, value);
  }

  static Future<bool> getIsRequestProviderWhileGuest() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isRequestProviderWhileGuest) ?? false;
  }

  static setIsRequestProviderWhileGuest(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isRequestProviderWhileGuest, value);
  }

  static Future<Provider?> getProvider() async {
    final prefs = await SharedPreferences.getInstance();
    final providerJson = prefs.getString(providerKey);
    if (providerJson != null) {
      return Provider.fromJson(providerJson as Map<String, dynamic>);
    }
    return null;
  }

  static setProvider(Provider provider) async {
    final prefs = await SharedPreferences.getInstance();
    final providerJson = provider.toJson();
    await prefs.setString(providerKey, providerJson as String);
  }

  static Future<String> getPaymentMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(paymentMode) ?? "";
  }

  static setPaymentMode(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(paymentMode, value);
  }

  static Future<bool> getScreenPreventLook() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(screenPreventLock) ?? false;
  }

  static setScreenPreventLook(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(screenPreventLock, value);
  }

  static Future<Order> getOrder() async {
    final prefs = await SharedPreferences.getInstance();
    String? orderJson = prefs.getString(orderKey);
    if (orderJson != null) {
      return Order.fromJson(json.decode(orderJson));
    } else {
      return Order.withDefaults();
    }
  }

  static Future<void> saveOrder(Order order) async {
    final prefs = await SharedPreferences.getInstance();
    String orderJson = json.encode(order.toJson());
    await prefs.setString(orderKey, orderJson);
  }

  static Future<void> clearOrder() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(orderKey);
    await setIsRequestProviderWhileGuest(false);
    await setScreenPreventLook(false);
  }

  static clear() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}
