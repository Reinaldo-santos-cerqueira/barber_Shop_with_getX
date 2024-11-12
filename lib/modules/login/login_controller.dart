import 'package:app_barber_shop/application/theme/colors_project.dart';
import 'package:app_barber_shop/services/firebase/store/user_service.dart';
import 'package:app_barber_shop/utils/translate_function.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';

class LoginController extends GetxController {
  final textOr = "or".obs;
  final seePassword = false.obs;
  final loadingButton = false.obs;
  final loadingScreen = false.obs;
  final textBtnLogin = "login".obs;
  final textBtnSignUp = "sign up".obs;
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
    loadingScreen(true);
    textBtnLogin(await translateFunction(textBtnLogin.value));
    textBtnSignUp(await translateFunction(textBtnSignUp.value));
    textProblem(await translateFunction(textProblem.value));
    textBtnClickMe(await translateFunction(textBtnClickMe.value));
    placeHolderEmail(await translateFunction(placeHolderEmail.value));
    placeHolderPassword(await translateFunction(placeHolderPassword.value));
    textOr(await translateFunction(textOr.value));
    messageErroEmail(await translateFunction(messageErroEmail.value));
    messageErroPassword(await translateFunction(messageErroPassword.value));
    loadingScreen(false);
  }

  login(context) async {
    loadingButton(true);
    if (!formKey.currentState!.validate()) {
      loadingButton(false);
      return;
    }
    try {
      await UserService().signIn(emailController.text, passwordController.text);
      QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          backgroundColor: ColorsProject.bgColor,
          titleColor: Colors.white,
          textColor: Colors.white,
          confirmBtnColor: Colors.transparent,
          text: await translateFunction('Successful login!'),
          onConfirmBtnTap: () {
            Get.back(); 
            Get.offAllNamed("/home");
          });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          backgroundColor: ColorsProject.bgColor,
          titleColor: Colors.white,
          textColor: Colors.white,
          confirmBtnColor: Colors.transparent,
          text: await translateFunction('Credencials invalid!'),
        );
      } else if (e.code == 'wrong-password') {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          backgroundColor: ColorsProject.bgColor,
          titleColor: Colors.white,
          textColor: Colors.white,
          confirmBtnColor: Colors.transparent,
          text: await translateFunction('Credencials invalid!'),
        );
      }
    } catch (e) {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        backgroundColor: ColorsProject.bgColor,
        titleColor: Colors.white,
        textColor: Colors.white,
        confirmBtnColor: Colors.transparent,
        text: await translateFunction(
            'Internal server error.\n Try again in a little while'),
      );
    } finally {
      loadingButton(false);
    }
  }

  goSignUp() {
    Get.toNamed('/signup');
  }
}
