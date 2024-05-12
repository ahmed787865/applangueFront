import 'package:flutter/material.dart';

import '../utils/app_constants.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {required this.controller,
        this.isObscureText = false,
        this.textInputType = TextInputType.text,
        this.hintText,
        this.hintStyle,
        this.validator,
        this.suffix,
        this.onTap,
        this.readOnly = false,
        this.maxLines = 1,
        this.enabled = true,
        this.color,
         this.onChanged,
        });

  TextEditingController controller;
  bool enabled;
  bool? isObscureText;
  TextInputType? textInputType;
  String? hintText;
  int ? maxLines;
  TextStyle? hintStyle;
  FormFieldValidator<String>? validator;
  Widget? suffix;
  Color? color;
  Function()? onTap;
  bool? readOnly;
 final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.start,
      controller: controller,
      onTap: onTap,
      readOnly: readOnly!,
      style: AppConstants.appBarTextStyle,
      obscureText: isObscureText!,
      keyboardType: textInputType,
      maxLines: maxLines,
      onChanged: onChanged,
      decoration: InputDecoration(
          fillColor: color,
          filled: true,
          enabled: enabled,
          hintText: hintText,
          hintStyle: hintStyle,
          suffixIcon: suffix,
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(12)),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(12), right: Radius.circular(12)))),
      validator: validator,
    );
  }
}