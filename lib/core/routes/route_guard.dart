import 'package:flutter/material.dart';
import 'package:flutter_pos/util/app_util.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';

class RouteGuard extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // return AppUtil.getUserInfo() == null
    //     ? const RouteSettings(name: '/login')
    //     : null;
  }
}
