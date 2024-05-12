import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../model/chop_category.dart';

class AppConstants {
  static const String appName = 'Startup';
  static const String logo = 'assets/images/log1.jpg';
  static const String googleApiKey = 'AIzaSyB8U3i3_i17EeSw8vWauz2v7NmLJ_QLerE';

//COLORS
  static const int _primaryValue = 0xffb74093;
  static const primaryColor = Color(_primaryValue);

  static const Map<int, Color> _primarySwatch = {
    50: Color(_primaryValue),
    100: Color(_primaryValue),
    200: Color(_primaryValue),
    300: Color(_primaryValue),
    400: Color(_primaryValue),
    500: Color(_primaryValue),
    600: Color(_primaryValue),
    700: Color(_primaryValue),
    800: Color(_primaryValue),
    900: Color(_primaryValue),
  };

  static const MaterialColor primaryColorSwatch =
      MaterialColor(_primaryValue, _primarySwatch);

  static const secondColor = const Color(0xff000000);
  static const thirdColor = const Color(0xFFD32F2F);
  static Color hintColor = const Color(0xff424242);
  static Color mainColorLight = const Color(0xffFFD26D);
  static Color subtitleColor = const Color(0xff000000).withOpacity(0.5);
  static Color offWhite = const Color(0xffF8F8F8);

  //TEXT
  static const String longTitle = "Lorem ipsum dolor sit amet,consetetur";
  static const String longText =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquet arcu id tincidunt tellus arcu rhoncus, turpis nisl sed. Neque viverra ipsum orci, morbi semper. Nulla bibendum purus tempor semper purus. Ut curabitur platea sed blandit. Amet non at proin justo nulla et. A, blandit morbi suspendisse vel malesuada purus massa mi. Faucibus neque a mi";


  // Text Style
  static String outFitMedium = "Outfit-Medium";
  static TextStyle appBarTextStyle = TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontFamily: outFitMedium,
      fontWeight: FontWeight.w500);
  static TextStyle textStyle8w500halfBlack = TextStyle(
    fontSize: 8,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.27,
    color: subtitleColor,
    fontFamily: outFitMedium
  );
  static TextStyle textStyle14w400Black = const TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.w400);

// images
  // app images
  // static String cart = 'assets/images/cartLine.svg';
  static String ranch = 'assets/images/ranch.png';
  // static String paperPuncher = 'assets/images/paperPuncher.jpg';
  // static String dummy = 'assets/images/dummy.png';

  // profile
  static String logout = 'assets/images/profile/logout.svg';
  static String manageOrders = 'assets/images/profile/manageOrders.svg';
  static String policy = 'assets/images/profile/policy.svg';
  static String profileIcon = 'assets/images/profile/profile.svg';
  static String settings = 'assets/images/profile/settings.svg';
  static String support = 'assets/images/profile/support.svg';

  //sub Category
  static String service1 = 'assets/images/service1.png';
  static String service2 = 'assets/images/service2.png';
  static String service3 = 'assets/images/service3.png';
  static String service4 = 'assets/images/service5.png';
  static String service5 = 'assets/images/service6.png';
  static String service6 = 'assets/images/service7.png';




  static List<ShopCategory> categoriesList = [
    ShopCategory(title: "Section", icon: Icons.electrical_services_outlined),
    ShopCategory(title: "Section", icon: Icons.work),
    ShopCategory(title: "Section", icon: FontAwesomeIcons.hammer),
    ShopCategory(title: "Section", icon: Icons.work),
    ShopCategory(title: "Section", icon: Icons.work),
    ShopCategory(title: "Section", icon: Icons.work),
    ShopCategory(title: "Section", icon: FontAwesomeIcons.paintRoller),
    ShopCategory(title: "Section", icon: Icons.work),
    ShopCategory(title: "Section", icon: Icons.work),
    ShopCategory(title: "Section", icon: Icons.work),
    ShopCategory(title: "Section", icon: Icons.work),
    ShopCategory(title: "Section", icon: FontAwesomeIcons.tree),
    ShopCategory(title: "Section", icon: Icons.work),
    ShopCategory(title: "Section", icon: Icons.work),
    ShopCategory(title: "Section", icon: Icons.work),
    ShopCategory(title: "Section", icon: FontAwesomeIcons.trashCan),
    ShopCategory(title: "Section", icon: Icons.work),
    ShopCategory(title: "Section", icon: FontAwesomeIcons.wrench),
  ];

  static Color whatsappColor = const Color.fromRGBO(37, 211, 102, 1.0);
}
