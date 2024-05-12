import 'package:get/get.dart';

import '../services.dart';

class SettingsService extends GetxService implements BaseService{
  static SettingsService get() => Get.find();

  @override
  Future<void> init() async {
  }
}