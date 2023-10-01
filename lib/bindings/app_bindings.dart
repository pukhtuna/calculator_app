import 'package:calculator_app/controller/calculator_controller.dart';
import 'package:get/get.dart';

class AppControllerBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(CalculatorController());
  }
}
