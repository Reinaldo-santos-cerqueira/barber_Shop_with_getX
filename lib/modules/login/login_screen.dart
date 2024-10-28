import 'package:app_barber_shop/application/theme/colors_project.dart';
import 'package:app_barber_shop/modules/login/login_controller.dart';
import 'package:app_barber_shop/utils/get_size.dart';
import 'package:app_barber_shop/widgets/app_bar_custom.dart';
import 'package:app_barber_shop/widgets/button.dart';
import 'package:app_barber_shop/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

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
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Center(
                            child: Image.asset(
                              'assets/images/logo.png',
                              width: 250,
                            ),
                          ),
                        ),
                        Input(
                          textHint: controller.placeHolderEmail.value,
                          controller: controller.emailController,
                          icon: Icons.email,
                          passwordInput: false,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Input(
                          textHint: controller.placeHolderPassword.value,
                          controller: controller.passwordController,
                          icon: Icons.lock_outline,
                          passwordInput: true,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [

                              Text(
                                controller.textProblem.value,
                                style: const TextStyle(
                                  color: ColorsProject.primaryColor,
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  padding: WidgetStateProperty.all(
                                    const EdgeInsets.only(
                                        top: 0, left: 5, bottom: 0, right: 0),
                                  ),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(0),
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: ColorsProject.primaryColor,
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    controller.textBtnClickMe.value,
                                    style: const TextStyle(
                                      color: ColorsProject.primaryColor,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Button(
                          textBtn: controller.textBtnLogin.value.toUpperCase(),
                          primaryButton: true,
                          onPressedFunction: () {
                            print(123);
                          },
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                color: ColorsProject.primaryColor,
                                height: 1,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              controller.textOr.value.toUpperCase(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: ColorsProject.primaryColor,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Container(
                                color: ColorsProject.primaryColor,
                                height: 1,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Button(
                          textBtn: controller.textBtnSignUp.value.toUpperCase(),
                          onPressedFunction: () {
                            print(123);
                          },
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
