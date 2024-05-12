import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_constants.dart';
import '../../utils/loading_idicator_dialog.dart';
import '../../utils/network.dart';
import '../../utils/preferences_manager.dart';
import '../../utils/variables.dart';
import '../main_screen.dart';

class UpdateWhatsappScreen extends StatefulWidget {
  @override
  _UpdateWhatsappScreenState createState() => _UpdateWhatsappScreenState();
}

class _UpdateWhatsappScreenState extends State<UpdateWhatsappScreen> {
  TextEditingController _whatsappController = TextEditingController();
  bool _isValidWhatsapp = false;

  void _validateWhatsapp() {
    String whatsapp = _whatsappController.text;
    bool isValid = _isValidWhatsappFormat(whatsapp);

    setState(() {
      _isValidWhatsapp = isValid;
    });
  }

  bool _isValidWhatsappFormat(String whatsapp) {
    // Basic phone number validation using a regular expression
    RegExp regex = RegExp(r'^\d{10}$'); // Assumes a 10-digit phone number
    return regex.hasMatch(whatsapp);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update whatsapp'),
        backgroundColor: AppConstants.primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: _whatsappController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Entre the new whatsapp',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _UpdateWhatsappScreen,
              child: Text('Validate'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: AppConstants.primaryColor,
              ),
            ),
            SizedBox(height: 16.0),
            _isValidWhatsapp
                ? Text(
                    'Whatsapp is valid!',
                    style: TextStyle(color: Colors.green),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }

  _UpdateWhatsappScreen() async {
    LoadingIndicatorDialog().show(context);
    var data = {"whatsapp": _whatsappController.text};
    try {
      var res = await Network().addData(data, Variables.UPDATE_WHATSAPP);
      LoadingIndicatorDialog().dismiss();
      var body = json.decode(res.body);
      print("body: " + body.toString());
      if (200 == res.statusCode && body.toString() == "Success") {
        PreferencesManager.setWhatsapp(data['whatsapp']!);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Success"),
        ));
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainScreen(selectedIndex: 3),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("login-msg".tr + ", " + body.toString()),
        ));
      }
    } catch (e) {
      LoadingIndicatorDialog().dismiss();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("login-msg-catch".tr + e.toString()),
      ));
      return null;
    }
  }
}
