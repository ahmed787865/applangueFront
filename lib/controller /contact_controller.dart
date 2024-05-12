
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactController extends GetxController {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final contentController = TextEditingController();

  Future<void> openWhatsapp() async {
    var whatsapp = "+22234191360";
    var whatsappURlAndroid = "whatsapp://send?phone=$whatsapp";
    var whatsappURLIos = "https://wa.me/$whatsapp";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunchUrl(Uri.parse(whatsappURLIos))) {
        await launchUrl(Uri.parse(
          whatsappURLIos,
        ));
      } else {
        Get.snackbar("whatsapp-err".tr, "whatsapp-not-found".tr,
            icon: const Icon(Icons.error));
      }
    } else {
      // android , web
      if (await canLaunchUrl(Uri.parse(whatsappURlAndroid))) {
        await launchUrl(Uri.parse(whatsappURlAndroid));
      } else {
        Get.snackbar("whatsapp".tr, "whatsapp-not-found".tr);
      }
    }
  }

  Future<void> contactUs() async {
    // final response = await ApiService.get()
    //     .postRequest(
    //     data: {
    //       "name": nameController.text,
    //       "phone": phoneController.text,
    //       "content": contentController.text
    //     },
    //     converter: (response) {},
    //     url: ApiList.CONTACT_US,
    //     isIsolate: false);
    //
    // response.fold((l) => Get.snackbar("con-err".tr, "con-err-content".tr),
    //         (r) {
    //       Get.back();
    //     });
  }

}