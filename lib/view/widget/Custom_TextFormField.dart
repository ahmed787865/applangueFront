import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Custom_Text.dart';

class CustomtextFormField extends StatelessWidget {
  final String text;

  final String hint;


  const CustomtextFormField({super.key, required this.text, required this.hint, });



  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomText(
            text: text,
            fontSize: 14,
            color: Colors.grey.shade900,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              fillColor: Colors.white,
            ),
          ),

        ],
      ),
    );
  }
}
