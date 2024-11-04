import 'package:app_barber_shop/modules/pre_login/pre_login_controller.dart';
import 'package:app_barber_shop/utils/get_size.dart';
import 'package:app_barber_shop/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PreLoginScreen extends GetView<PreLoginController> {
  const PreLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var getSize =  GetSize().sizeScreen(context);
    return Obx(() {
      return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg.jpg'),
                fit: BoxFit.cover,
                alignment: Alignment.topRight),
          ),
          child: Container(
            width: getSize.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color.fromRGBO(0, 0, 0, 0.9),
                  Color.fromRGBO(0, 0, 0, .7),
                  Color.fromRGBO(0, 0, 0, .1),
                ],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
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
                  Padding(
                    padding: EdgeInsets.only(
                      left: getSize.width * .1,
                      bottom: 30.0,
                      right: getSize.width * .1,
                    ),
                    child: Button(
                      onPressedFunction: () => controller.goLogin(),
                      textBtn: controller.textBtnLogin.value,
                      primaryButton: true,
                      loading: RxBool(false).obs,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: getSize.width * .1,
                      bottom: 50.0,
                      right: getSize.width * .1,
                    ),
                    child: Button(
                      onPressedFunction: () => controller.goSignUp(),
                      textBtn: controller.textBtnSignUp.value,
                      loading: RxBool(false).obs,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
