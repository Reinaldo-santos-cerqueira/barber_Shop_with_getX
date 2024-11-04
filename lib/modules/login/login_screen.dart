import 'package:app_barber_shop/application/theme/colors_project.dart';
import 'package:app_barber_shop/modules/login/login_controller.dart';
import 'package:app_barber_shop/utils/get_size.dart';
import 'package:app_barber_shop/widgets/app_bar_custom.dart';
import 'package:app_barber_shop/widgets/button.dart';
import 'package:app_barber_shop/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:validatorless/validatorless.dart';

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
                  child: SizedBox(
                    width: double.infinity,
                    child: Form(
                      key: controller.formKey,
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
                            icon: const Icon(
                              Icons.alternate_email,
                              color: ColorsProject.primaryColor,
                            ),
                            passwordInput: false,
                            validator: Validatorless.email(
                                controller.messageErroEmail.value),
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
                            validator: Validatorless.regex(
                                RegExp(
                                    r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{10,}$'),
                                controller.messageErroPassword.value),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
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
                          Obx(() {
                            return Button(
                              textBtn:
                                  controller.textBtnLogin.value.toUpperCase(),
                              primaryButton: true,
                              onPressedFunction: () {
                                controller.login();
                              },
                              loading: controller.loadingButton.obs,
                            );
                          }),
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
                          Obx(() {
                            return Button(
                              textBtn:
                                  controller.textBtnSignUp.value.toUpperCase(),
                              onPressedFunction: () {
                                controller.goSignUp();
                              },
                              loading: Rx<RxBool>(false.obs),
                            );
                          }),
                          const SizedBox(height: 20),
                        ],
                      ),
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
