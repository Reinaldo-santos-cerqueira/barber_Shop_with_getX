import 'package:app_barber_shop/utils/get_size.dart';
import 'package:flutter/material.dart';

import '../application/theme/colors_project.dart';

class Input extends StatefulWidget {
  final String textHint;
  final TextEditingController controller;
  final Widget icon;
  final bool passwordInput;
  final FormFieldValidator<String>? validator;

  const Input({
    super.key,
    required this.textHint,
    required this.controller,
    required this.icon,
    required this.passwordInput,
    required this.validator,
  });

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
      decoration: const BoxDecoration(
        color: ColorsProject.bgInput,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.icon,
            const SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                validator: widget.validator,
                controller: widget.controller,
                maxLines: 1,
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
