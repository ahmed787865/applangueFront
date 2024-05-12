import 'dart:convert';
import '/screens/auth/verification_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_constants.dart';
import '../../utils/config.dart';
import '../../utils/loading_idicator_dialog.dart';
import '../../utils/network.dart';
import '../../utils/preferences_manager.dart';
import '../../utils/variables.dart';
import '../../widgets/app_button.dart';
import '../../widgets/custom_fields.dart';
import '../main_screen.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController whatsapp = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  _signupForm() {
    return Expanded(
      child: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: fullWidth(context) * 0.07),
          shrinkWrap: true,
          physics: ScrollPhysics(),
          children: [
            SizedBox(height: fullHeight(context) * 0.02),
            Center(
              child: Text(
                "create-account".tr,
                style: TextStyle(
                    fontSize: fullWidth(context) * 0.08,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: fullHeight(context) * 0.01),
            Center(child: Text("sign-up-msg".tr)),
            Image(
                height: fullHeight(context) * 0.15,
                image: const AssetImage(AppConstants.logo)),
            CustomTextFild(
                color: const Color.fromARGB(255, 226, 224, 224),
                hint: "name",
                controller: username),
            SizedBox(height: fullHeight(context) * 0.025),
            CustomTextFild(
                color: const Color.fromARGB(255, 226, 224, 224),
                hint: "phone".tr,
                controller: phone,
                keyboardType: TextInputType.phone),

            SizedBox(height: fullHeight(context) * 0.025),
            CustomTextFild(
                color: const Color.fromARGB(255, 226, 224, 224),
                hint: "password",
                controller: password),
            SizedBox(height: fullHeight(context) * 0.025),
            AppButton(
              onPressed: () {
                _signUp();
              },
              title: "sign-up",
              textColor: Colors.black,
              color: AppConstants.primaryColor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("have-account".tr),
                TextButton(
                    onPressed: () => Get.off(() => LoginScreen()),
                    child: Text(
                      "sign-in".tr,
                      style: const TextStyle(color: AppConstants.primaryColor),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }

  _signUp() async {
    if (!mounted) return;
    var data = {
      "username": username.text,
      "phone_number": phone.text,
      "whatsapp": whatsapp.text,
      "password": password.text,
    };

    final response;
    try {
      LoadingIndicatorDialog().show(context);
      response = await Network().authData(data, Variables.REGISTRATION);
      LoadingIndicatorDialog().dismiss();
      // Map<String, dynamic> responseBody = jsonDecode(response.body);

      if (response.statusCode == 201) {
        print(" user create sucsfully ");
        if (!mounted) return;
        PreferencesManager.setPhoneNumber(data['phone_number']!);
        PreferencesManager.setUserName(data['username']!);
        PreferencesManager.setWhatsapp(data['whatsapp']!);
        PreferencesManager.setPassword(data['password']!);
        PreferencesManager.setIsWaitingForVerificationCode(true);
        // verificate code page
        Get.off(() => LoginScreen());
      } else if (response.statusCode == 400) {
        // Handle error response
        final errorData = jsonDecode(response.body);
        if (errorData['phone_number'] != null) {
          final errorMessage = errorData['phone_number']
              [0]; // Assuming error messages are provided as a list
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("signup-msg: ".tr + errorMessage.toString())));
        } else
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("signup-msg: ".tr + jsonDecode.toString())));
        // if (!mounted) return;
        // String msg = responseBody['phone_number'].toString();
        // print(response.statusCode);
        // print("responseBody");
        // print(responseBody);
        // print(msg);
        // ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(content: Text("signup-msg".tr + msg.toString())));
      } else {}
    } catch (e) {
      if (!mounted) return;
      print("catch: " + e.toString());
      LoadingIndicatorDialog().dismiss();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("signup-msg-catch ".tr + e.toString())));
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        SizedBox(height: fullHeight(context) * 0.05),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
              onPressed: () => Get.toNamed('/main'),
              child: Text(
                "skip".tr,
                style: TextStyle(
                    fontSize: fontSize10(context) * 1.5, color: Colors.black),
              )),
        ),
        _signupForm(),
        SizedBox(height: fullHeight(context) * 0.02),
      ]),
    );
  }
}
