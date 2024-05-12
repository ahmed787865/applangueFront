
import 'package:applanguefront/screens/auth/settings_screen.dart';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../services/storage/storage_service.dart';
import '../contactus_screen.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 23,
          toolbarHeight: 80,

          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset("assets/images/Logo.svg"),
          ),
          title: const Text("My Profile" , style: TextStyle(fontWeight: FontWeight.bold),)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: Icon(CarbonIcons.user, ),
              onTap:() => Get.to(() => SettingsScreen()),
              title: Row(
                children: [
                  SizedBox(width: 18, ),
                  Text("Edit Profile", style: TextStyle(fontSize: 18 , decoration: TextDecoration.none)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Divider(thickness: 0.5),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Divider(thickness: 0.5),
            ),
            ListTile(
              onTap: () => Get.to(() => SettingsScreen()),
              leading: Icon(CarbonIcons.settings, ),
              title: Row(
                children: [
                  SizedBox(width: 18, ),
                Text("Settings", style: TextStyle(fontSize: 18 , decoration: TextDecoration.none)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Divider(thickness: 0.5),
            ),
            ListTile(
              onTap: () => Get.to(() => ContactScreen()),
              leading: Icon(CarbonIcons.headset),
              title: Row(
                children: [
                  SizedBox(width: 18, ),
                  Text("Support", style: TextStyle(fontSize: 18 , decoration: TextDecoration.none)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Divider(thickness: 0.5,),
            ),
            ListTile(
              leading: Icon(CarbonIcons.security, ),
              title: Row(
                children: [
                  SizedBox(width: 18, ),
                  Text("Policy", style: TextStyle(fontSize: 18 , decoration: TextDecoration.none)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Divider(thickness: 0.5),
            ),
            ListTile(
              onTap: () {
                StorageService.get().reset();
                Get.offAllNamed('/login');
              },
              leading: Icon(CarbonIcons.logout, color: Colors.redAccent),
              title: Row(
                children: [
                  SizedBox(width: 18, ),
                  Text("Log out", style: TextStyle(fontSize: 18 , decoration: TextDecoration.none, )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Divider(thickness: 0.5,),
            ),
          ],
        ),
      ),
    );
  }
}
