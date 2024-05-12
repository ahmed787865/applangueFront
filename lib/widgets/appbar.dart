

import '../utils/preferences_manager.dart';
import '/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/config.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  MyAppBar({super.key, required this.title, this.showClose = false});
  String title;
  bool showClose;
  var height = AppBar().preferredSize.height;

  @override
  Size get preferredSize =>
      Size.fromHeight(height); // Specify the preferred height

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        title: Text(
          title,
          style: TextStyle(
              color: Colors.black,
              fontSize: fullWidth(context) * 0.04,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 18,
              color: Colors.black,
            )),
        actions: [
          if (showClose)
            IconButton(
                onPressed: () => _showConfirmationDialog(context),
                icon: const Icon(
                  Icons.close,
                  size: 18,
                  color: Colors.black,
                ))
        ],
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(15),
        )));
  }

  void _showConfirmationDialog(BuildContext context) {
    // Use Get.dialog to show your custom dialog
    Get.dialog(
      AlertDialog(
        title: Text('Confirmation'),
        content: Text('Are you sure you want to leave this page?'),
        actions: <Widget>[
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Get.back(); // Closes the dialog
            },
          ),
          TextButton(
            child: Text('Confirm'),
            onPressed: () async {
              await PreferencesManager.clearOrder();
              Get.back(); // Closes the dialog
              Get.off(() =>
                  MainScreen()); // Navigates to the HomeScreen after closing the dialog
            },
          ),
        ],
      ),
      barrierDismissible:
          false, // Dialog will not close if tapped outside of the alert dialog
    );
  }
}
