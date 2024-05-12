import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:get/get.dart';

import '../services.dart';


class PermissionService extends GetxService implements BaseService{
  static PermissionService get() => Get.find<PermissionService>();


  @override
  Future<void> init() async{

  }

  Future<bool> _requestPermission(Permission permission) async {
    final status = await permission.request();
    return status == PermissionStatus.granted;
  }

  Future<bool> requestWriteExternalStoragePermission() async {
    var granted = await _requestPermission(Permission.storage);
    return granted;
  }

  showAppSettings(Permission permission) {
    // Get.generalDialog(pageBuilder: (context, _, __) {
    //   return AppSettingsAlert(permission: permission.toString(),);
    // });
  }

  Future<bool> requestLocationPermission() async {
    var status = await Permission.location.request();
    if (status == PermissionStatus.granted) {
      return true;
    } else if (status == PermissionStatus.permanentlyDenied) {
      showAppSettings(Permission.location);
      return false;
    } else {
      showAppSettings(Permission.location);
      return false;
    }
  }

  Future<PermissionStatus> checkPermission(Permission permission) async {
    return permission.status;
  }


  Future<bool> requestBackgroundLocationPermission() async {
    try {
      var status = await Permission.locationAlways.request();
      return status == PermissionStatus.granted;
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        // Handle permanent denial
      } else {
        // Handle other errors
      }
      return false;
    }
  }



}