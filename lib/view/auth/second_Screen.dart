import 'package:applanguefront/core/view_model/auth_view_model.dart';
import 'package:applanguefront/screens/all_categories.dart';
import 'package:applanguefront/screens/auth/login_screen.dart';
import 'package:applanguefront/screens/main_screen.dart';
import 'package:applanguefront/view/widget/App_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthViewModel authViewModel = Get.put(AuthViewModel());
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context), // Pop the current page
          ),
          title: Text('weework for  training'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Obx(() => Text("${authViewModel.counter.value}")),
            ),
            AppButton(
              onPressed: () {
                Get.to(MainScreen());
              },
              text: "INCREMENT",
            ),
            SizedBox(
              height: 20,
            ),
            AppButton(
              onPressed: () {
                Get.to(LoginScreen());
              },
              text: 'Home',
            ),
            SizedBox(height: 20,),
            AppButton(
              onPressed: () {
                Get.to(AllCategories());
              },
              text: 'listes category',
            )
          ],
        ));
  }
}
