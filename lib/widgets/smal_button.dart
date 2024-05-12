import '/utils/app_constants.dart';
import 'package:flutter/material.dart';

import '../utils/config.dart';

class SmallButton extends StatelessWidget {
  String title;
  bool isBlack;
  Function()? onTap;
  SmallButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.isBlack = true});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          width: fullWidth(context) * 0.2,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          decoration: BoxDecoration(
              color: isBlack ? Colors.black : AppConstants.primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  color: isBlack ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: fullWidth(context) * 0.025),
            ),
          )),
    );
  }
}
