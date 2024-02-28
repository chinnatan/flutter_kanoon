import 'package:flutter_pos/app/middleware/auth_middleware.dart';
import 'package:flutter_pos/core/routes/app_routes.dart';
import 'package:flutter_pos/ui/views/home/home_binding.dart';
import 'package:flutter_pos/ui/views/home/home_view.dart';
import 'package:flutter_pos/ui/views/login/login_binding.dart';
import 'package:flutter_pos/ui/views/login/login_view.dart';
import 'package:flutter_pos/ui/views/main/main_binding.dart';
import 'package:flutter_pos/ui/views/main/main_view.dart';
import 'package:flutter_pos/ui/views/splash/splash_binding.dart';
import 'package:flutter_pos/ui/views/splash/splash_view.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static String initial = Routes.splash;

  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => SplashView(),
      preventDuplicates: true,
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: Routes.login,
      page: () => LoginView(),
      preventDuplicates: true,
      bindings: [
        LoginBinding(),
      ],
    ),
    GetPage(
      name: Routes.root,
      middlewares: [EnsureAuthMiddleware()],
      page: () => MainView(),
      bindings: [MainBinding()],
    ),
    GetPage(
      name: Routes.home,
      middlewares: [EnsureAuthMiddleware()],
      page: () => const HomeView(),
      bindings: [
        HomeBinding(),
      ],
    ),
  ];
}
