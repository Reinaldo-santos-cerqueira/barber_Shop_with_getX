import 'package:flutter/material.dart';

import '../application/theme/colors_project.dart';
import '../utils/get_size.dart';

class Button extends StatelessWidget {
  final bool? primaryButton;
  final String textBtn;
  final Function onPressedFunction;

  const Button(
      {super.key,
      this.primaryButton,
      required this.textBtn,
      required this.onPressedFunction});

  @override
  Widget build(BuildContext context) {
    var getSize =  GetSize().sizeScreen(context);
    return SizedBox(
      width: getSize.width,
      height: 50.0,
      child: ElevatedButton(
        onPressed: () {
          onPressedFunction();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryButton == true
              ? ColorsProject.primaryColor
              : Colors.transparent,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: ColorsProject.primaryColor),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
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
  }
}
