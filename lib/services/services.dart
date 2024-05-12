

import 'package:applanguefront/services/permission/permission_service.dart';
import 'package:applanguefront/services/settings/settings_service.dart';
import 'package:applanguefront/services/storage/storage_service.dart';
import 'package:get/get.dart';


import 'api/api_list.dart';
import 'api/api_service.dart';
import 'firebase/firebase_services.dart';
import 'location/location_service.dart';

abstract class AppServices {
  static Future<void> init() async {
    /// order matters.
    await Get.put(StorageService()).init();
    await Get.put(ApiService(ApiList.baseUrl)).init();
    await Get.put(FirebaseService()).init();
    await Get.put(PermissionService()).init();
    await Get.put(LocationService()).init();

    await Get.put(SettingsService()).init();

    /// request for notifications permissions.
    await FirebaseService.get().initFCM();

    _initRepositories();
  }

  static void _initRepositories() {
    /// if we need repositories, register here.
    Get.lazyPut(() => ());
  }
}

abstract class BaseService {
  Future<void> init() async {}
}