import 'dart:io';

import 'package:app_barber_shop/application/theme/colors_project.dart';
import 'package:app_barber_shop/modules/signup/signup_controller.dart';
import 'package:app_barber_shop/modules/signup/widgets/bottom_sheet_galery.dart';
import 'package:app_barber_shop/utils/get_size.dart';
import 'package:app_barber_shop/widgets/app_bar_custom.dart';
import 'package:app_barber_shop/widgets/button.dart';
import 'package:app_barber_shop/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';

class SignUpScreen extends GetView<SignupController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = GetSize();
    var getSizeHeight = size.getHeightWithoutAppBar(context);

    return Obx(() {
      return Scaffold(
        appBar: const AppBarCustom(),
        backgroundColor: ColorsProject.bgColor,
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: getSizeHeight,
              ),
              child: IntrinsicHeight(
                child: SafeArea(
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Obx(() {
                          return GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return const BottomSheetGalery();
                                },
                              );
                            },
                            child: controller.imagePicked.value == null
                                ? const CircleAvatar(
                                    radius: 100,
                                    backgroundImage:
                                        AssetImage("assets/images/noPhoto.png"),
                                  )
                                : Container(
                                    width: 200,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: ColorsProject.bgColor,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: FileImage(
                                          controller.imagePicked.value!,
                                        ),
                                      ),
                                    ),
                                  ),
                          );
                        }), 
                        const SizedBox(
                          height: 30,
                        ),
                        Input(
                          textHint: controller.placeHolderName.value,
                          controller: controller.nameController,
                          icon: const LineIcon.user(
                            color: ColorsProject.primaryColor,
                          ),
                          passwordInput: false,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Input(
                          textHint: controller.placeHolderCpf.value,
                          controller: controller.cpfController,
                          icon: const LineIcon.addressCardAlt(
                            color: ColorsProject.primaryColor,
                          ),
                          passwordInput: false,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Input(
                          textHint: controller.placeHolderEmail.value,
                          controller: controller.emailController,
                          icon: const Icon(
                            Icons.alternate_email,
                            color: ColorsProject.primaryColor,
                          ),
                          passwordInput: false,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Input(
                          textHint: controller.placeHolderPassword.value,
                          controller: controller.passwordController,
                          icon: const LineIcon.lock(
                            color: ColorsProject.primaryColor,
                          ),
                          passwordInput: true,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Input(
                          textHint: controller.placeHolderConfirmPassword.value,
                          controller: controller.passwordConfirmController,
                          icon: const LineIcon.lock(
                            color: ColorsProject.primaryColor,
                          ),
                          passwordInput: true,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Button(
                          textBtn: controller.textBtnSignUp.value.toUpperCase(),
                          primaryButton: true,
                          onPressedFunction: () {},
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}