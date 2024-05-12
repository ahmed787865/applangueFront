import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CustomText extends StatelessWidget{
   final String text ;
   final double fontSize;
   final Color color;
   final Alignment alignment;

   CustomText({ this.text='', this.fontSize=30,this.color = Colors.black,this.alignment=Alignment.topLeft});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(text ,style: TextStyle(
        color: color,
        fontSize: fontSize,

      ),

      ),
    );
     }

}