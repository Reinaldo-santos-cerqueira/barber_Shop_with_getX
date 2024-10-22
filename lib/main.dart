import 'package:app_barber_shop/firebase_options.dart';
import 'package:app_barber_shop/modules/login/login_module.dart';
import 'package:app_barber_shop/modules/pre_login/pre_login_module.dart';
import 'package:app_barber_shop/modules/splash/splash_module.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "App Barber shop",
      getPages: [
        ...SplashModule().routers,
        ...LoginModule().routers,
        ...PreLoginModule().routers,
      ],
      builder: EasyLoading.init(),
    );
  }
}
