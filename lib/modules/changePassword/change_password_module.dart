import 'package:app_barber_shop/application/module/module.dart';
import 'package:app_barber_shop/modules/changePassword/change_password_bindings.dart';
import 'package:app_barber_shop/modules/changePassword/change_password_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class ChangePasswordModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/ChangePassword',
      page: () => const ChangePasswordScreen(),
      binding: ChangePasswordBindings(),
    ),
  ];
}
