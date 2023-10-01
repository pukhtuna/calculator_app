import 'package:calculator_app/view/main_page.dart';
import 'package:calculator_app/view/splash_screen.dart';
import 'package:get/get.dart';

List<GetPage> pages = [
  GetPage(
      name: '/splash',
      page: () => const SplashScreen(),
      transition: Transition.zoom),
  GetPage(
      name: '/main',
      page: () => CalculatorScreen(),
      transition: Transition.zoom),
];
