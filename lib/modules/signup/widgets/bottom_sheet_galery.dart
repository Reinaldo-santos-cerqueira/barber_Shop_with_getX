import 'package:app_barber_shop/application/theme/colors_project.dart';
import 'package:app_barber_shop/modules/signup/signup_controller.dart';
import 'package:app_barber_shop/utils/get_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';

class BottomSheetGalery extends StatelessWidget {
  const BottomSheetGalery({super.key});

  @override
  Widget build(BuildContext context) {
    var getSize = GetSize().sizeScreen(context);
    final SignupController controller = Get.find<SignupController>();
    return Container(
      color: ColorsProject.bgInput,
      width: double.infinity,
      height: getSize.height * 0.2,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Get.back();
                },
                icon:
                    const Icon(Icons.close, color: ColorsProject.primaryColor),
              ),
            ],
          ),
          InkWell(
            onTap: ()async {
              await  controller.captureImageFileFromCamera();
            },
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                LineIcon.camera(
                  color: ColorsProject.primaryColor,
                ),
                SizedBox(width: 10),
                Text(
                  "Acessar camera",
                  style: TextStyle(
                    color: ColorsProject.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15,),
          InkWell(
            onTap: () async {
              await controller.pickImageFileFromGallery();
            },
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                LineIcon.photoVideo(
                  color: ColorsProject.primaryColor,
                ),
                SizedBox(width: 10),
                Text(
                  "Acessar galeria",
                  style: TextStyle(
                    color: ColorsProject.primaryColor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
