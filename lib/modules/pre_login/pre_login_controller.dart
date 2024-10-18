import 'package:get/get.dart';

class PreLoginController extends GetxController  {
  @override
  Future<void> onInit() async {
    super.onInit();
  }

  void goLogin(){
    Get.offAllNamed('/login');
  }

  void goSignUp(){
    Get.offAllNamed('/signUp');
  }
}
