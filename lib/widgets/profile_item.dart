import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/config.dart';
import '../screens/auth/update_password_screen.dart';
import '../screens/auth/update_phone_number_screen.dart';
import '../screens/auth/update_whatsapp_screen.dart';

class ProfileItem extends StatelessWidget {
  String title;
  String val;
  String variableToChange;
  bool editable;
  ProfileItem(
      {super.key,
      required this.title,
      required this.val,
      this.editable = true,
      required this.variableToChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: fullWidth(context) * 0.08),
      child: Container(
          padding: EdgeInsets.symmetric(
              vertical: fullHeight(context) * 0.007,
              horizontal: fullWidth(context) * 0.05),
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 225, 225, 225),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      title.tr,
                      style: TextStyle(
                        color: const Color.fromARGB(255, 122, 121, 121),
                        fontSize: fullWidth(context) * 0.03,
                      ),
                    ),
                  ),
                  Text(val,
                      style: TextStyle(
                          fontSize: fullWidth(context) * 0.043,
                          fontWeight: FontWeight.w600)),
                ],
              ),
              if (editable)
                IconButton(
                    onPressed: () {
                      _navigate(context, variableToChange);
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: Color.fromARGB(255, 122, 121, 121),
                      size: 15,
                    ))
            ],
          )),
    );
  }

  _navigate(BuildContext context, String variable) {
    if (variable == "password") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UpdatePasswordScreen()),
      );
    }

    if (variable == "phoneNumber") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UpdatePhoneNumberScreen()),
      );
    }

    if (variable == "whatsapp") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UpdateWhatsappScreen()),
      );
    }
  }
}
