
import 'package:applanguefront/utils/extensions/string_ext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../model/login_info.dart';
import '../../services/api/api_list.dart';
import '../../services/api/api_service.dart';
import '../../services/firebase/firebase_services.dart';
import '../../services/storage/storage_service.dart';


class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final focusNode = FocusNode();
  bool isValid = false;
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  final isLoading = false.obs;


  login() async {
    var data = {"phone_number": phone.text, "password": password.text};

      var response = await ApiService.get().postRequest(
          data: data,
          converter: (response) =>
            LoginInfo.fromJson(response as Map<String, dynamic>)
          , url: ApiList.LOGIN, isIsolate: false);

      response.fold(
              (l) {},
              (r) {
                StorageService.get().apiToken = r.token!;
                StorageService.get().isLoggedIn = true;
                StorageService.get().apiUserData = {
                  'user_name': r.username,
                  'phone_number': phone.text,
                };
                isLoading.value = false;
                FirebaseService.sendToServer(StorageService.get().fcmToken);
                Get.offAllNamed("/main");
              });

      }

  @override
  void onInit() {
    super.onInit();
    phone.addListener(() {
      if (phone.text.length >= 8) {
        focusNode.unfocus();
      }
    });
  }

  String? validate(String? value) {
    if(value != null && value.isNotEmpty && !value.isValidNumber()){
      return "inv-num".tr;
    }
    return null;
  }
  bool check() {
    return phone.text.length == 8 && password.text.isNotEmpty;
  }
}
