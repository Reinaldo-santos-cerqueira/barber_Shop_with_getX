import 'package:app_barber_shop/widgets/icon_back.dart';
import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget{
  final String? title;
  const AppBarCustom({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: const IconBack(),
      title: Text("$title!"),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
