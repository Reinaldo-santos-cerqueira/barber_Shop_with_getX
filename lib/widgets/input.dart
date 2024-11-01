import 'package:app_barber_shop/utils/get_size.dart';
import 'package:flutter/material.dart';

import '../application/theme/colors_project.dart';

class Input extends StatefulWidget {
  final String textHint;
  final TextEditingController controller;
  final Widget icon;
  final bool passwordInput;

  const Input(
      {super.key,
      required this.textHint,
      required this.controller,
      required this.icon,
      required this.passwordInput});

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  bool obscureText = false;

  changeObscureText() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  void initState() {
    widget.passwordInput == true ? obscureText = true : obscureText = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var getSize = GetSize().sizeScreen(context);
    return Container(
      width: getSize.width,
      height: 50,
      decoration: const BoxDecoration(
        color: ColorsProject.bgInput,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget.icon,
            const SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                controller: widget.controller,
                obscureText: obscureText,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: widget.textHint,
                    hintStyle: const TextStyle(
                      color: ColorsProject.primaryColor,
                    )),
                style: const TextStyle(color: ColorsProject.primaryColor),
              ),
            ),
            const SizedBox(width: 10),
            widget.passwordInput == true
                ? (obscureText == true
                    ? IconButton(
                        onPressed: () {
                          changeObscureText();
                        },
                        icon: const Icon(Icons.visibility_off,
                            color: ColorsProject.primaryColor),
                      )
                    : IconButton(
                        onPressed: () {
                          changeObscureText();
                        },
                        icon: const Icon(Icons.visibility,
                            color: ColorsProject.primaryColor),
                      ))
                : Container()
          ],
        ),
      ),
    );
  }
}
