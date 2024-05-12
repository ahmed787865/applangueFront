import 'package:applanguefront/controller%20/settings_controller.dart';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../utils/app_constants.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingsController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 23,
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 16),
          child: Text(
            "Settings",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              Card(
                color: Colors.white,
                elevation: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: Icon(CarbonIcons.language),
                      title: Text("Languages", ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      height: 180,
                      child: ListView.builder(
                          itemCount: controller.languages.length,
                          itemBuilder: (context, index) {
                                return RadioListTile(
                                  hoverColor: Colors.orangeAccent.shade700,
                                  activeColor: AppConstants.primaryColor,
                                  title: Text(controller.languages[index]['name']),
                                  value: controller.languages[index]['locale'],
                                  groupValue: controller.selectedLanguage,
                                  onChanged: (value) {
                                    Get.updateLocale(value);
                                    controller.selectedLanguage = value;
                                  },
                                  selected: controller.selectedLanguage == controller.languages[index]['locale'],
                                );
                          }),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
