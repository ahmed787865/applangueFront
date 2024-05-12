import '/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/config.dart';

class AppBarWithImage extends StatelessWidget {
  String title;
  String url;
  bool showClose;
  AppBarWithImage(
      {super.key,
      required this.title,
      required this.url,
      this.showClose = false});
  String url2 =
      "https://ejmel.nyc3.digitaloceanspaces.com/ouvriers/media/categories/images/maconnerie.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=YDBZKUPXRUKK3GIAHERT%2F20231031%2Fnyc3%2Fs3%2Faws4_request&X-Amz-Date=20231031T070332Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=8073dc9d8e126c31811fae3ecdfa06738ff732018af0738bd37ff7729d38d3ed";
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ColorFiltered(
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5), BlendMode.srcATop),
          child: Container(
            height: fullHeight(context) * 0.28,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60),
              ),
              image:
                  DecorationImage(fit: BoxFit.cover, image: NetworkImage(url)),
            ),
          ),
        ),
        Column(
          children: [
            SizedBox(height: fullHeight(context) * 0.065),
            Padding(
              padding: EdgeInsets.only(
                  right: showClose
                      ? fullWidth(context) * 0.05
                      : fullWidth(context) * 0.4,
                  left: fullWidth(context) * 0.05),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 18,
                        )),
                    Text(
                      title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: fullWidth(context) * 0.04,
                          fontWeight: FontWeight.w600),
                    ),
                    if (showClose)
                      IconButton(
                          onPressed: () => Get.off(() => MainScreen()),
                          icon: const Icon(
                            Icons.close,
                            size: 18,
                          ))
                  ]),
            ),
          ],
        )
      ],
    );
  }
}
