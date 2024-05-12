import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_constants.dart';

class SmallCustomContainer extends StatelessWidget {
  final void Function() onTap;
  final Icon? icon;
  final double width, height;
  final Color? color;
  final String? svgImg;
  const SmallCustomContainer({
    super.key,
    required this.onTap,
    this.icon,
    required this.width,
    required this.height,
    this.color,
    this.svgImg,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: color ?? AppConstants.offWhite,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: icon ??
                const Icon(Icons.ac_unit_sharp)
          )),
    );
  }
}


class CustomAppBar extends StatelessWidget {
  final String title;
  final Widget? playButton, notificationButton, leadingIcon;
  const CustomAppBar({
    super.key,
    required this.title,
    this.playButton,
    this.notificationButton,
    this.leadingIcon,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            leadingIcon ?? SvgPicture.asset(AppConstants.logo),
            const SizedBox(width: 22),
            Text(
              title,
              style: AppConstants.appBarTextStyle,
            ),
          ],
        ),
        SizedBox(
          child: Row(
            children: [
              playButton != null ? playButton! : const SizedBox.shrink(),
              const SizedBox(width: 20),
              notificationButton != null
                  ? notificationButton!
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ],
    );
  }
}


class ReUseRow extends StatelessWidget {
  final String? text;
  final String? text2;

  final Function()? onTapSeeAll;
  const ReUseRow({this.text, this.text2, this.onTapSeeAll,super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text!,
              style:
                  const TextStyle(fontWeight: FontWeight.w400, fontSize: 17.5)),
          GestureDetector(
            onTap: text2 == null ? null : onTapSeeAll,
            child: Text(text2 == null ? '' :text2.toString(),
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 14.5)),
          ),
        ],
      ),
    );
  }
}


class CustomContainer extends StatelessWidget { 
  final double? width;
  final double? height;
  final Color? colors;
  final Widget? widget;

  const CustomContainer({super.key, this.width, this.height, this.colors, this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: colors,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: widget,
      ),
    );
  }
}