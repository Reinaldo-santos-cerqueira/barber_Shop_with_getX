import 'dart:io';

import 'package:app_barber_shop/utils/translate_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignupController extends GetxController {
  final textBtnSignUp = "cadastro".obs;
  final placeHolderEmail = "Digite seu email".obs;
  final placeHolderName = "Digite seu email".obs;
  final placeHolderCpf = "Digite seu email".obs;
  final placeHolderPassword = "Digite sua senha".obs;
  final placeHolderConfirmPassword = "Confirme sua senha".obs;
  Rx<File?> imagePicked = Rx<File?>(null); 
  XFile? imageFile;
  TextEditingController emailController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final seePassword = false.obs;

  File? get profileImage => imagePicked.value;

  @override
  Future<void> onInit() async {
    super.onInit();
    textBtnSignUp(await translateFunction(textBtnSignUp.value));
    placeHolderEmail(await translateFunction(placeHolderEmail.value));
    placeHolderCpf(await translateFunction(placeHolderCpf.value));
    placeHolderName(await translateFunction(placeHolderName.value));
    placeHolderPassword(await translateFunction(placeHolderPassword.value));
    placeHolderConfirmPassword(await translateFunction(placeHolderConfirmPassword.value));
  }

  pickImageFileFromGallery() async {
    try {
      imageFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (imageFile != null) {
        imagePicked.value = File(imageFile!.path);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  captureImageFileFromCamera() async {
    try {
      imageFile =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (imageFile != null) {
        imagePicked.value = File(imageFile!.path);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
