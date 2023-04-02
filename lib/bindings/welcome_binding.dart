import 'package:get/get.dart';
import 'package:kannada_devangar/controller/welcome_controller.dart';

class WelcomeBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<Welcome_Controller>(() => Welcome_Controller());
  }
}