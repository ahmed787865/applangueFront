import 'package:applanguefront/screens/auth/signup_screen.dart';
import 'package:applanguefront/utils/app_constants.dart';
import 'package:applanguefront/utils/config.dart';
import 'package:applanguefront/widgets/app_text_field.dart';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller /auth/login_controller.dart';
import '../../view/widget/App_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController controller = Get.put(LoginController());

  _loginForm() {
    return Form(
      key: controller.formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //const Image(height: 150, image: AssetImage("/asset/image")),
            const SizedBox(height: 16),
            Center(
              child: Text(
                "welcome",
                style:
                    const TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
              ),
            ),
            Center(child: Text("sign-in-msg")),
            const SizedBox(height: 16),
            const SizedBox(height: 16),
            AppTextField(
                controller: controller.phone,
                icon: CarbonIcons.phone,
                hintText: "phone".tr),
            const SizedBox(height: 16),
            AppTextField(
              controller: controller.password,
              icon: CarbonIcons.locked,
              hintText: "password".tr,
              obscureText: true,
              isPassword: true,
            ),
            const SizedBox(height: 16),
            const SizedBox(height: 16),
            AppButton(onPressed: controller.login, text: "sign-in".tr,),
            const SizedBox(height: 16),
            TextButton(
                onPressed: () {
                  Get.toNamed('/forgot-password');
                },
                child: Text("forgot-password".tr,
                    style: const TextStyle(color: Colors.black))),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("no-account".tr),
                  TextButton(
                      onPressed: () => Get.off(() => const SignUpScreen()),
                      child: Text(
                        "sign-up".tr,
                        style:
                            const TextStyle(color: AppConstants.primaryColor),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Align(
              alignment: Alignment.topRight,
              child: TextButton(
                  onPressed: () => Get.offAllNamed('/main'),
                  child: Text(
                    "skip".tr,
                    style: TextStyle(
                        fontSize: fontSize10(context) * 1.5,
                        color: Colors.black),
                  )),
            ),
          ),
          _loginForm(),
        ],
      ),
    );
  }
}
