import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  @override
  Future<void> onInit() async {
    super.onInit();
    await getVersion();
  }

  Future<void> getVersion() async {
    await getLanguage();
    await Future.delayed(const Duration(seconds: 1));
    Get.offAllNamed('/preLogin');
  }

  Future<void> getLanguage() async {
    Locale? currentLocale = Get.deviceLocale;
    String? language = currentLocale?.languageCode.toString();
    final box = GetStorage();

    box.write('language', language);
  }
}
