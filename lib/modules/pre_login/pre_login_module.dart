import 'package:app_barber_shop/application/module/module.dart';
import 'package:app_barber_shop/modules/pre_login/pre_login_bindings.dart';
import 'package:app_barber_shop/modules/pre_login/pre_login_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class PreLoginModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/preLogin',
      page: () => const PreLoginScreen(),
      binding: PreLoginBindings(),
    ),
  ];
}
