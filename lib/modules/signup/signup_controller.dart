import 'dart:io';

import 'package:app_barber_shop/application/theme/colors_project.dart';
import 'package:app_barber_shop/models/user_model.dart';
import 'package:app_barber_shop/services/firebase/store/user_service.dart';
import 'package:app_barber_shop/utils/translate_function.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quickalert/quickalert.dart';

class SignupController extends GetxController {
  final textBtnSignUp = "cadastro".obs;
  final placeHolderEmail = "Digite seu email".obs;
  final placeHolderName = "Digite seu nome".obs;
  final placeHolderCpf = "Digite seu cpf".obs;
  final placeHolderPassword = "Digite sua senha".obs;
  final placeHolderConfirmPassword = "Confirme sua senha".obs;
  final messageErroCpf = "Insira um cpf valido".obs;
  final messageErroName = "Insira um nome valido".obs;
  final messageErroEmail = "Insira um email valido".obs;
  final messageErroConfirmPassword =
      "A confirmação de senha deve ser igual a senha".obs;
  final messageErroPassword = "A senha precisa ser forte".obs;

  Rx<File?> imagePicked = Rx<File?>(null);
  XFile? imageFile;
  TextEditingController emailController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final seePassword = false.obs;
  final loadingScreen = false.obs;
  final loadingButton = false.obs;

  final formKey = GlobalKey<FormState>();
  File? get profileImage => imagePicked.value;

  @override
  Future<void> onInit() async {
    super.onInit();
    loadingScreen(true);
    textBtnSignUp(await translateFunction(textBtnSignUp.value));
    placeHolderEmail(await translateFunction(placeHolderEmail.value));
    placeHolderCpf(await translateFunction(placeHolderCpf.value));
    placeHolderName(await translateFunction(placeHolderName.value));
    placeHolderPassword(await translateFunction(placeHolderPassword.value));
    placeHolderConfirmPassword(
        await translateFunction(placeHolderConfirmPassword.value));
    messageErroCpf(await translateFunction(messageErroCpf.value));
    messageErroName(await translateFunction(messageErroName.value));
    messageErroEmail(await translateFunction(messageErroEmail.value));
    messageErroConfirmPassword(
        await translateFunction(messageErroConfirmPassword.value));
    messageErroPassword(await translateFunction(messageErroPassword.value));
    loadingScreen(false);
  }

  pickImageFileFromGallery() async {
    try {
      imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (imageFile != null) {
        imagePicked.value = File(imageFile!.path);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  captureImageFileFromCamera() async {
    try {
      imageFile = await ImagePicker().pickImage(source: ImageSource.camera);
      if (imageFile != null) {
        imagePicked.value = File(imageFile!.path);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  signup(context) async {
    loadingButton(true);
    try {
      if (!formKey.currentState!.validate()) {
        loadingScreen(false);
        return;
      }
      UserModel user = UserModel(
        name: nameController.text,
        cpf: cpfController.text,
        password: passwordController.text,
        email: emailController.text,
        photo: imagePicked.value!.path,
      );
      await UserService().create(user);
      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        backgroundColor: ColorsProject.bgColor,
        titleColor: Colors.white,
          textColor: Colors.white,
          confirmBtnColor: Colors.transparent,
        text: await translateFunction('Criado com sucesso!'),
        onConfirmBtnTap: () {
          Get.back();
          Get.offAllNamed("/login");
        }
      );
    } on FirebaseAuthException catch (e) {
      String message = _handleAuthError(e);
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: 'Oops...',
          text: await translateFunction(message),
          backgroundColor: ColorsProject.bgColor,
          titleColor: Colors.white,
          textColor: Colors.white,
          confirmBtnColor: Colors.transparent);
    } on FirebaseException catch (e) {
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: 'Oops...',
          text: await translateFunction("Erro no Firestore: ${e.message}"),
          titleColor: Colors.white,
          textColor: Colors.white,
          backgroundColor: ColorsProject.bgColor,
          confirmBtnColor: Colors.transparent);
    } catch (e) {
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: 'Oops...',
          text: await translateFunction("Erro inesperado: $e"),
          backgroundColor: ColorsProject.bgColor,
          titleColor: Colors.white,
          textColor: Colors.white,
          confirmBtnColor: Colors.transparent);
    } finally {
      loadingButton(false);
    }
  }

  String _handleAuthError(FirebaseAuthException e) {
    String message;
    switch (e.code) {
      case 'email-already-in-use':
        message = "O e-mail já está em uso por outra conta.";
        break;
      case 'invalid-email':
        message = "O e-mail é inválido.";
        break;
      case 'operation-not-allowed':
        message = "Operação não permitida.";
        break;
      case 'weak-password':
        message = "A senha fornecida é muito fraca.";
        break;
      default:
        message = "Erro desconhecido no FirebaseAuth: ${e.message}";
        break;
    }
    return message;
  }
}
