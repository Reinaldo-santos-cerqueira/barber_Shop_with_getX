import 'package:app_barber_shop/services/firebase/messaging/firebase_messaging.dart';
import 'package:app_barber_shop/utils/translate_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  final textOr = "or".obs;
  final seePassword = false.obs;
  final textBtnLogin = "login".obs;
  final textBtnSignUp = "sign up".obs;
  final loadingButton = false.obs;
  final formKey = GlobalKey<FormState>();
  final textBtnClickMe = "Clique aqui".obs;
  final textProblem = "Problemas com login?".obs;
  final placeHolderEmail = "Digite seu email".obs;
  final placeHolderPassword = "Digite seu senha".obs;
  final messageErroEmail = "Insira um email valido".obs;
  final messageErroPassword = "A senha precisa ser forte".obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
    messageErroEmail(await translateFunction(messageErroEmail.value));
    messageErroPassword(await translateFunction(messageErroPassword.value));
  }

  login() async {
    await MessagingFirebase().getToken();
  }

  goSignUp() {
    Get.toNamed('/signup');
  }
}
