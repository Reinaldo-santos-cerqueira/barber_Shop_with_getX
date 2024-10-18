import 'package:app_barber_shop/application/module/module.dart';
import 'package:app_barber_shop/modules/login/login_bindings.dart';
import 'package:app_barber_shop/modules/login/login_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class LoginModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/login',
      page: () => const LoginScreen(),
      binding: LoginBindings(),
    ),
  ];
}