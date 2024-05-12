import 'dart:convert';
import '../../utils/custom_messaging_service.dart';
import '/screens/auth/renew_password_screen.dart';
import '/screens/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../utils/app_constants.dart';
import '../../utils/loading_idicator_dialog.dart';
import '../../utils/network.dart';
import '../../utils/preferences_manager.dart';
import '../../utils/variables.dart';
import '../main_screen.dart';

class VerificationCodeScreen extends StatefulWidget {
  @override
  _VerificationCodeScreenState createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  TextEditingController _verificationCodeController = TextEditingController();

  _verifyCode() async {
    LoadingIndicatorDialog().show(context);
    String code = _verificationCodeController.text;
    String? phone_number = await PreferencesManager.getPhoneNumber();
    String? password = await PreferencesManager.getPassword();

    var data = {
      "phone_number": phone_number,
      "verification_code": code,
    };

    final response;
    try {
      response =
          await Network().authData(data, Variables.IS_VALIDE_VERIFICATION_CODE);
      LoadingIndicatorDialog().dismiss();
      print("response:" + response.statusCode.toString());
      final body = jsonDecode(response.body);
      print(body);
      if (body.toString() == "true") {
        print("body == true");
        PreferencesManager.setVerificationCode(code);
        if (await PreferencesManager.getIsForgotPassword() == true) {
          print("forgot password");
          // renue password
          Get.off(() => RenewPasswordScreen());
        } else
          _login(phone_number, password);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(body.toString()),
        ));
        _verificationCodeController.clear();
      }
    } catch (e) {
      LoadingIndicatorDialog().dismiss();
      print("My error: " + e.toString());
      return null;
    }
  }

  _resendCode() async {
    String? phone_number = await PreferencesManager.getPhoneNumber();

    var data = {
      "phone_number": phone_number,
    };

    final response;
    try {
      response =
          await Network().authData(data, Variables.RESEND_VERIFICATION_CODE);
      LoadingIndicatorDialog().dismiss();
      print("response:" + response.statusCode.toString());
      final body = jsonDecode(response.body);
      print(body);
    } catch (e) {
      LoadingIndicatorDialog().dismiss();
      print("My error: " + e.toString());
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verification Code'),
        backgroundColor:
            AppConstants.primaryColor, // Match app bar color with button color
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Use the default back arrow icon
          onPressed: () {
            Get.off(SignUpScreen()); // Navigate to the previous screen
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Digital field for verification code
              TextField(
                controller: _verificationCodeController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                maxLength: 4,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 36.0,
                  letterSpacing: 16.0,
                  color: AppConstants.primaryColor,
                  fontWeight: FontWeight.bold, // Add some boldness to the text
                ),
                decoration: InputDecoration(
                  hintText: '****',
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: AppConstants.primaryColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: AppConstants.primaryColor),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              // Buttons for verification and resend
              ElevatedButton(
                onPressed: _verifyCode, // No need to use anonymous functions
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppConstants.primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: Text(
                  'Verify',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              SizedBox(height: 10.0), // Add spacing between buttons
              ElevatedButton(
                onPressed: _resendCode, // No need to use anonymous functions
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppConstants.primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: Text(
                  'Resend',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _login(phone_number, password) async {
    // call login function
    var loginData = {
      "phone_number": phone_number,
      "password": password,
    };
    try {
      LoadingIndicatorDialog().show(context);
      var res = await Network().authData(loginData, Variables.LOGIN);
      LoadingIndicatorDialog().dismiss();
      var body = json.decode(res.body);
      if (200 == res.statusCode) {
        CustomMessagingService().configure();

        PreferencesManager.setAuthToken(body["token"]);
        PreferencesManager.setUserName(body["user_name"]);
        PreferencesManager.setUserType(body["user_type"]);
        PreferencesManager.setIsLoggedIn(true);

        Get.off(() => MainScreen());
      }
    } catch (e) {
      LoadingIndicatorDialog().dismiss();
      print("My error: " + e.toString());
      return null;
    }
  }
}
