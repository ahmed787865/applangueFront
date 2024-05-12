import 'dart:ui';

import 'package:applanguefront/localization/lang.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController{
  final languages = LocaleString.locales;
  var selectedLanguage = Get.locale;

  setLanguage(String locale) {
    LocaleString.updateLanguage(Locale.fromSubtags(languageCode: locale));
  }

  @override
  void onReady() {
    print(selectedLanguage);
  }
}
