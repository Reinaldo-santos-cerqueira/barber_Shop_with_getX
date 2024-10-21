import 'package:app_barber_shop/modules/login/login_controller.dart';
import 'package:get/get.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      LoginController(),
    );
  }
}
