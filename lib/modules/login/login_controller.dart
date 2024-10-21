import 'package:app_barber_shop/utils/translate_function.dart';
import 'package:get/get.dart';

class LoginController extends GetxController  {
  final textBtnLogin = "login".obs;
  final textBtnSignUp = "sign up".obs;
  final textProblem = "Problemas com login?".obs;
  final textBtnClickMe = "Clique aqui".obs;
  final placeHolderEmail = "Digite seu email".obs;
  final placeHolderPassword = "Digite seu senha".obs;
  final textOr = "or".obs;
  final seePassword = false.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    textBtnLogin(await translateFunction(textBtnLogin.value));
    textBtnSignUp(await translateFunction(textBtnSignUp.value));
    textProblem(await translateFunction(textProblem.value));
    textBtnClickMe(await translateFunction(textBtnClickMe.value));
    placeHolderEmail(await translateFunction(placeHolderEmail.value));
    placeHolderPassword(await translateFunction(placeHolderPassword.value));
    textOr(await translateFunction(textOr.value));
  }
}
