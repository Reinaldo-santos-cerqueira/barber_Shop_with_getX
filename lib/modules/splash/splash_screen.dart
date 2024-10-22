import 'package:app_barber_shop/application/theme/colors_project.dart';
import 'package:app_barber_shop/modules/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsProject.primaryColor,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                'assets/images/logo.png',
                width: 250,
              ),
            ),
          ),
          LoadingAnimationWidget.stretchedDots(color: Colors.black, size: 50),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
