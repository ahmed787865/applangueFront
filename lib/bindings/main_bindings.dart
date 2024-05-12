

import 'package:applanguefront/screens/main_screen.dart';
import 'package:get/get.dart';


import '../controller /auth/home_screen_controller.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => const MainScreen(), fenix: true);
  }

}