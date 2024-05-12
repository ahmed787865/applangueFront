import 'package:flutter/material.dart';

import '../utils/app_constants.dart';

class AppButton extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final String text;
  final VoidCallback? onPressed;

  const AppButton(
      {super.key,
      required this.onPressed,
      this.height = 56,
      this.width = double.infinity,
      required this.text,
      this.color = AppConstants.primaryColor});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height,
      minWidth: width,
      onPressed: onPressed,
      elevation: 0,
      disabledColor: Colors.grey,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: onPressed == null ? Colors.grey : color,
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            boxShadow: [
              BoxShadow(
                  color: color.withOpacity(0.6),
                  blurRadius: 10,
                  offset: const Offset(5, 5))
            ]
        ),
        child: Center(child: Text(text, style: const TextStyle(fontSize: 14),)),
      ),
    );
  }
}
