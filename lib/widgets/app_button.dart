import 'package:applanguefront/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';


class AppButton extends StatelessWidget {
  final String title;
  final Color textColor;
  final Color? color;
  final bool isWhatsapp;
  final bool isSmalle;
  final double? width; // Optional width
  final void Function()? onPressed;

  AppButton({
    super.key,
    required this.title,
    required this.textColor,
    this.color,
    this.onPressed,
    this.isWhatsapp = false,
    this.isSmalle = false, this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
          isSmalle ? fullHeight(context) * 0.038 : fullHeight(context) * 0.055,
      width: width ?? fullWidth(context) * (isSmalle ? 0.8 : 0.9),
      child: MaterialButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        disabledColor: const Color.fromARGB(255, 205, 204, 204),
        color: color,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(isSmalle ? 5 : 10)),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isWhatsapp)
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: fullWidth(context) * 0.01),
                child: Icon(
                  FontAwesomeIcons.whatsapp,
                  size: fullWidth(context) * 0.05,
                  color: Colors.white,
                ),
              ),
            Text(
              title.tr,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: textColor,
                  fontSize: isSmalle
                      ? fullWidth(context) * 0.035
                      : fullWidth(context) * 0.04),
            ),
          ],
        )),
      ),
    );
  }
}
