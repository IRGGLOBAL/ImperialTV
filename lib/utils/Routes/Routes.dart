import 'package:get/get.dart';

import '../../app_module/splash_screen/view/splash_view.dart';


class Routes {
  static final routes = [
    GetPage(name: '/', page: () => const SplashView()),
  ];
}
