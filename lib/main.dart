import 'package:app_barber_shop/firebase_options.dart';
import 'package:app_barber_shop/modules/home/home_module.dart';
import 'package:app_barber_shop/modules/login/login_module.dart';
import 'package:app_barber_shop/modules/pre_login/pre_login_module.dart';
import 'package:app_barber_shop/modules/signup/signup_module.dart';
import 'package:app_barber_shop/modules/splash/splash_module.dart';
import 'package:app_barber_shop/services/firebase/check_valid.dart';
import 'package:app_barber_shop/services/firebase/messaging/firebase_messaging.dart';
import 'package:app_barber_shop/services/permissions/get_permissions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await MessagingFirebase().initNotification();
  await requestStoragePermission(Permission.storage);
  await requestCameraAndStoragePermissions();
  await checkGooglePlayServices();
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
        ...SignupModule().routers,
        ...HomeModule().routers
      ],
      builder: EasyLoading.init(),
    );
  }
}
