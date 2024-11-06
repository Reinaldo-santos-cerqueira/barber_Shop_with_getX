import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../application/theme/colors_project.dart';
import '../utils/get_size.dart';

class Button extends StatelessWidget {
  final bool? primaryButton;
  final String textBtn;
  final Function onPressedFunction;
  final RxBool loading;

  const Button({
    super.key,
    this.primaryButton,
    required this.textBtn,
    required this.onPressedFunction,
    required this.loading,
  });

  @override
  Widget build(BuildContext context) {
    var getSize = GetSize().sizeScreen(context);
    return Obx(() {
      return SizedBox(
        width: getSize.width,
        height: 50.0,
        child: ElevatedButton(
          onPressed: loading == true.obs ? () {} : () => onPressedFunction(),
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryButton == true
                ? ColorsProject.primaryColor
                : Colors.transparent,
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: ColorsProject.primaryColor),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: loading == true.obs
              ? Container(
                  width: 24,
                  height: 24,
                  padding: const EdgeInsets.all(2.0),
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 3,
                  ),
                )
              : Text(
                  textBtn.toUpperCase(),
                  style: TextStyle(
                      fontSize: 24,
                      color: primaryButton == true
                          ? Colors.black
                          : ColorsProject.primaryColor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5),
                ),
        ),
      );
    });
  }
}
