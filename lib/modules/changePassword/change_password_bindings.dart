import 'package:app_barber_shop/modules/changePassword/change_password_controller.dart';
import 'package:get/get.dart';

class ChangePasswordBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      ChangePasswordController(),
    );
  }
}
