import 'package:app_barber_shop/application/module/module.dart';
import 'package:app_barber_shop/modules/signup/signup_bindings.dart';
import 'package:app_barber_shop/modules/signup/signup_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class SignupModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/signup',
      page: () => const SignUpScreen(),
      binding: SignupBindings(),
    ),
  ];
}
