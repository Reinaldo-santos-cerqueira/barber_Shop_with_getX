import 'package:app_barber_shop/application/theme/colors_project.dart';
import 'package:app_barber_shop/modules/login/login_controller.dart';
import 'package:app_barber_shop/utils/get_size.dart';
import 'package:app_barber_shop/widgets/button.dart';
import 'package:app_barber_shop/widgets/icon_back.dart';
import 'package:app_barber_shop/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    var size = GetSize();
    var getSize = size.sizeScreen(context);

    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: const IconBack(),
        ),
        backgroundColor: ColorsProject.bgColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: getSize.width * .1),
          child: SizedBox(
            width: Size.infinite.width,
            height: size.getHeightWithoutAppBar(context),
            child: Form(
              child: SingleChildScrollView(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  height: size.getHeightWithoutAppBar(context),
                  child: Column(
                    mainAxisSize: MainAxisSize.min, 
                    children: [
                      Input(
                        passwordInput: false,
                        textHint: "Digite seu email",
                        controller: emailController,
                        icon: Icons.alternate_email,
                      ),
                      const SizedBox(height: 30),
                      Input(
                        passwordInput: true,
                        textHint: "Digite sua senha",
                        controller: passwordController,
                        icon: Icons.lock,
                      ),
                      const SizedBox(height: 30),
                      Button(
                        textBtn: controller.textBtnLogin.value.toUpperCase(),
                        primaryButton: true,
                        onPressedFunction: () {
                          print(123);
                        },
                      ),
                      Row(
                        children: [
                          Text(
                            controller.textProblem.value,
                            style: const TextStyle(
                              color: ColorsProject.primaryColor,
                              fontSize: 18,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
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
                                  fontSize: 18,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ),
                        ],
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
                      const SizedBox(height: 50),
                    ],
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
