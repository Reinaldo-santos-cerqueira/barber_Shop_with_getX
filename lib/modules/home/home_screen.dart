import 'package:app_barber_shop/application/theme/colors_project.dart';
import 'package:app_barber_shop/modules/pre_login/pre_login_controller.dart';
import 'package:app_barber_shop/utils/get_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<PreLoginController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var getSize = GetSize().sizeScreen(context);
    return Scaffold(
      body: Container(
        width: getSize.width,
        color: ColorsProject.bgColor,
      ),
    );
  }
}
