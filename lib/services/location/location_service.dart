import 'dart:async';


import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../services.dart';

class LocationService extends GetxService implements BaseService {
  static LocationService get() => Get.find<LocationService>();

  @override
  Future<void> init() async {

  }


  Future<Position> getCoordinates() async {
    return Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
}
