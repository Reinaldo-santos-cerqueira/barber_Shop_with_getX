import 'package:app_barber_shop/application/module/module.dart';
import 'package:app_barber_shop/modules/splash/splash_bindings.dart';
import 'package:app_barber_shop/modules/splash/splash_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class SplashModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/',
      page: () => const SplashScreen(),
      binding: SplashBindings(),
    ),
  ];
}