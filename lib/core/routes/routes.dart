import 'package:flutter_pos/ui/views/home/home_view.dart';
import 'package:flutter_pos/ui/views/login/controller/login_controller.dart';
import 'package:flutter_pos/ui/views/login/login_view.dart';
import 'package:flutter_pos/ui/views/main/controller/main_controller.dart';
import 'package:flutter_pos/ui/views/main/main_view.dart';
import 'package:flutter_pos/ui/views/splash/controller/splash_controller.dart';
import 'package:flutter_pos/ui/views/splash/splash_view.dart';
import 'package:get/get.dart';

abstract class Routes {
  static const login = '/login';
  static const splash = '/splash';

  static const root = '/';
  static const home = '/home';
}

abstract class AppPages {
  static String initial = Routes.login;

  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashView(),
      binding: BindingsBuilder.put(() => SplashController()),
    ),
    GetPage(
      name: Routes.login,
      page: () => LoginView(),
      binding: BindingsBuilder.put(() => LoginController()),
    ),
    GetPage(
      name: Routes.root,
      page: () => MainView(),
      binding: BindingsBuilder.put(() => MainController()),
    ),
    GetPage(name: Routes.home, page: () => const HomeView())
  ];
}
