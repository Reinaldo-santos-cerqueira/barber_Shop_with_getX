import 'package:app_barber_shop/utils/translate_function.dart';
import 'package:get/get.dart';

class PreLoginController extends GetxController  {
  final textBtnLogin = "Login".obs;
  late var textBtnSignUp = "Sign Up".obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    textBtnSignUp(await translateFunction(textBtnSignUp.value));
    textBtnLogin(await translateFunction(textBtnLogin.value));
  }

  void goLogin(){
    Get.toNamed('/login');
  }

  void goSignUp(){
    Get.toNamed('/signUp');
  }
}
