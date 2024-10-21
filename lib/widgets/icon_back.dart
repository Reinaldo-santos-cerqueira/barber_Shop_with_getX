import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../application/theme/colors_project.dart';

class IconBack extends StatelessWidget {
  const IconBack({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios, color: ColorsProject.primaryColor),
      onPressed: () {
        Get.back();
      },
    );
  }
}
