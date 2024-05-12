import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../utils/app_logger.dart';
import '../services.dart';

class StorageService extends GetxService implements BaseService {


  static StorageService get() => Get.find<StorageService>();

  late GetStorage _box;
  late bool _isFirstLaunch;
  late bool _isLoggedIn;


  set fcmEnabled(bool? value) => _write(_Keys.fcmEnabled, value);

  bool? get fcmEnabled => _box.read(_Keys.fcmEnabled) ;

  bool? get firstLaunch => _box.read(_Keys.firstLaunch);

  set firstLaunch(bool? value) => _write(_Keys.firstLaunch, value);

  String? get apiToken => _box.read(_Keys.apiToken);

  set apiToken(String? value) => _write(_Keys.apiToken, value);

  bool? get isLoggedIn => _box.read(_Keys.isLoggedIn);

  set isLoggedIn(bool? value) => _write(_Keys.isLoggedIn, value);

  String? get fcmToken => _box.read(_Keys.fcmToken);

  set fcmToken(String? value) => _write(_Keys.fcmToken, value);

  bool? get themeIsDark => _box.read(_Keys.themeIsDark) ?? false;

  set themeIsDark(bool? value) => _write(_Keys.themeIsDark, value);

  Map<String, dynamic>? get apiUserData => _box.read(_Keys.apiUserInfo);

  set apiUserData(Map<String, dynamic>? value) =>
      _write(_Keys.apiUserInfo, value);

  String? get userLocale => _box.read(_Keys.locale);

  set userLocale(String? value)  => _write(_Keys.locale, value);


  @override
  Future<void> init() async {
    _box = GetStorage('settings');
    await _box.initStorage;
    _isLoggedIn = _box.read(_Keys.isLoggedIn) ?? false;
    if(!_isLoggedIn) {
      _box.write(_Keys.isLoggedIn, false);
      _box.write(_Keys.apiToken, '');
    }
  }

  void reset() => _box.erase();

  void _write<T>(String key, T value) {
    value == null ? _box.remove(key) : _box.write(key, value);
  }
}

abstract class _Keys {
  static const String firstLaunch = 'first_launch';
  static const String apiToken = 'api_token';
  static const String apiUserInfo = 'api_user_info';
  static const String themeIsDark = 'theme_dark';
  static const String fcmToken = 'fcm_token';
  static const String isLoggedIn = 'is_logged_in';

  static const String fcmEnabled = 'fcm_enabled';

  static const String locale = 'user_locale';
}
