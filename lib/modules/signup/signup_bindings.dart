import 'package:app_barber_shop/modules/signup/signup_controller.dart';
import 'package:get/get.dart';

class SignupBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      SignupController(),
    );
  }
}
