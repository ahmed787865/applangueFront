import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function() ontap;
  final String title;
  final String? image;
  final Color? color;
  final double? height;
  final double? width;
  final TextStyle? appStyle;
final bool isEnabled;
  const CustomButton(
      {Key? key,
      required this.title,
      required this.ontap,
      this.image,
      this.height = 58,
      this.width = double.infinity,
      this.color,
      this.appStyle, required this.isEnabled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isEnabled ? ontap : null, // Conditional onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: isEnabled ? color : Colors.grey, // Conditional color
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if(image!=null)  Image.asset(image!,height: 20,width: 20),
               SizedBox(width: image == null ? 0 :10),
              Text(
      title,
      style: appStyle,
      overflow: TextOverflow.ellipsis,
    )
              
            ],
          ),
        ),
      ),
    );
  }
}
