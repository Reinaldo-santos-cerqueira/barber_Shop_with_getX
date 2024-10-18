import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController  {
  @override
  Future<void> onInit() async {
    super.onInit();
    await getVersion();
  }
  Future<void> getVersion() async {
    await Future.delayed(const Duration(seconds: 1));
    // Get.offAllNamed('/preLogin');
  }

  Future<void> getLanguage(context) async{
    Locale currentLocale = Localizations.localeOf(context);
    final box = GetStorage();
    box.write('language', currentLocale);

  }
}
