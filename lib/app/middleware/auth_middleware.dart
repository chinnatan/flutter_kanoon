import 'package:flutter_pos/core/routes/app_routes.dart';
import 'package:flutter_pos/util/app_util.dart';
import 'package:get/get.dart';

class EnsureAuthMiddleware extends GetMiddleware {
  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    await Future.delayed(const Duration(milliseconds: 500));
    var user = AppUtil.getUserInfo();
    if (user == null) {
      Get.offAllNamed(Routes.login);
    }
    return await super.redirectDelegate(route);
  }

  // @override
  // Future<RouteDecoder?> redirectDelegate(RouteDecoder route) async {
  //   // you can do whatever you want here
  //   // but it's preferable to make this method fast
  //   await Future.delayed(const Duration(milliseconds: 500));

  //   if (!AuthService.to.isLoggedInValue) {
  //     final newRoute = Routes.LOGIN_THEN(route.pageSettings!.name);
  //     return RouteDecoder.fromRoute(newRoute);
  //   }
  //   return await super.redirectDelegate(route);
  // }
}

// class EnsureNotAuthedMiddleware extends GetMiddleware {
//   @override
//   Future<RouteDecoder?> redirectDelegate(RouteDecoder route) async {
//     if (AuthService.to.isLoggedInValue) {
//       //NEVER navigate to auth screen, when user is already authed
//       return null;

//       //OR redirect user to another screen
//       //return RouteDecoder.fromRoute(Routes.PROFILE);
//     }
//     return await super.redirectDelegate(route);
//   }
// }
