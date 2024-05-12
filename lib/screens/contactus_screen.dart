import 'package:applanguefront/controller%20/contact_controller.dart';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_constants.dart';



class ContactScreen extends StatelessWidget {
  ContactScreen({super.key});



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final ContactController controller = Get.put(ContactController());

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("contact".tr),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(children: [
                const SizedBox(
                  height: 16,
                ),

                const SizedBox(
                  height: 16,
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      width: size.width,
                      decoration: BoxDecoration(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(CarbonIcons.pen,
                              size: 32, color: AppConstants.primaryColor),
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: TextField(
                              controller: controller.nameController,
                              style: const TextStyle(fontSize: 18),
                              decoration: InputDecoration(
                                  border: InputBorder.none, hintText: "name".tr),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                      child: Row(
                        children: [
                          Icon(
                            CarbonIcons.phone,
                            size: 32,
                            color: AppConstants.primaryColor,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: TextField(
                              controller: controller.phoneController,
                              style: const TextStyle(fontSize: 18),
                              decoration: InputDecoration(
                                  border: InputBorder.none, hintText: "phone".tr),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      height: 128,
                      decoration: BoxDecoration(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                      child: TextField(
                        controller: controller.contentController,
                        style: const TextStyle(fontSize: 18),
                        maxLines: 7,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "content".tr,
                            alignLabelWithHint: false,
                            icon: Icon(
                              CarbonIcons.edit,
                              color: AppConstants.primaryColor,
                              size: 32,
                            )),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                MaterialButton(
                  onPressed: () async{
                    await controller.contactUs();
                  },
                  elevation: 0,
                  padding: const EdgeInsets.all(18),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: AppConstants.primaryColor,
                  child: Center(
                      child: Text(
                        "send".tr,
                        style:
                        const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                ),
              ]),
            )));
  }
}

