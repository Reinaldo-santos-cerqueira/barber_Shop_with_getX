import 'package:app_barber_shop/application/theme/colors_project.dart';
import 'package:app_barber_shop/modules/login/login_controller.dart';
import 'package:app_barber_shop/utils/get_size.dart';
import 'package:app_barber_shop/widgets/button.dart';
import 'package:app_barber_shop/widgets/icon_back.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: const IconBack(),
        ),
        backgroundColor: ColorsProject.bgColor,
        body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getSize(context).width * .1),
          child: SizedBox(
            width: Size.infinite.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
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
                          color: ColorsProject.primaryColor, fontSize: 18),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(controller.textBtnClickMe.value,
                          style: const TextStyle(
                              color: ColorsProject.primaryColor,
                              fontSize: 18,
                            decoration: TextDecoration.underline
                          )
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
                          color: ColorsProject.primaryColor),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        color: ColorsProject.primaryColor,
                        height: 1,
                      ),
                    )
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
      );
    });
  }
}
