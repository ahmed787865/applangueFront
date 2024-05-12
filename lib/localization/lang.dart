import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ar_sa.dart';
import 'en_us.dart';
import 'fr_fr.dart';

class LocaleString extends Translations {
  static List locales = [
    {'name': 'English', 'locale': const Locale('en')},
    {'name': 'Français', 'locale': const Locale('fr')},
    {'name': 'العربية', 'locale': const Locale('ar')},
  ];

  static updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  static void updateLanguageAppBar(Locale locale) {
    Get.updateLocale(locale);
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en': enUS,
        'fr': frFr,
        'ar': arSA,
      };
}
