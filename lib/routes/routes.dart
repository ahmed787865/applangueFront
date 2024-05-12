import 'package:applanguefront/screens/auth/login_screen.dart';
import 'package:applanguefront/screens/auth/signup_screen.dart';
import 'package:applanguefront/screens/home_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';


import '../bindings/main_bindings.dart';
import '../screens/main_screen.dart';

appRoutes() => [
  GetPage(
    name: '/home',
    page: () =>  const HomeScreen(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/login',
    page: () => LoginScreen(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/signup',
    page: () =>  const SignUpScreen(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/splashScreen',
    page: () =>  LoginScreen(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/on_boarding',
    page: () => LoginScreen(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/main',
    page: () =>   const MainScreen(),
    binding: MainBindings(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 500),
  ),
];