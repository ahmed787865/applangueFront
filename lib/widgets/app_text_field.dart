import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  bool obscureText;
  final IconData icon;
  final TextInputType keyboardType;

  AppTextField(
      {super.key,
      required this.controller,
      required this.icon,
      required this.hintText,
      this.obscureText = false,
      this.keyboardType = TextInputType.text,
        this.isPassword = false});

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}


class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            widget.icon,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: TextField(
              controller: widget.controller,
              obscureText: widget.obscureText,
              keyboardType: widget.keyboardType,
              decoration: InputDecoration.collapsed(
                hintText: widget.hintText,

              ),

            ),
          ),
          const SizedBox(width: 8,),
          if (widget.isPassword)
            IconButton(
                onPressed: () {
                  setState(() {
                    widget.obscureText = !widget.obscureText;
                  });
                },
                icon: widget.obscureText ? const Icon(
                  CarbonIcons.view,
                ) : const Icon(CarbonIcons.view_off) ) ,
        ],
      ),
    );
  }
}
