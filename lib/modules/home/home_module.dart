import 'package:app_barber_shop/application/module/module.dart';
import 'package:app_barber_shop/modules/home/home_bindings.dart';
import 'package:app_barber_shop/modules/home/home_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class HomeModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/home',
      page: () => const HomeScreen(),
      binding: HomeBindings(),
    ),
  ];
}
