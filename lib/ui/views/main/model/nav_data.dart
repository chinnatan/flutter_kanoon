import 'package:flutter/material.dart';
import 'package:flutter_pos/core/routes/routes.dart';
import 'package:flutter_pos/ui/views/home/home_view.dart';
import 'package:get/route_manager.dart';

abstract class NavKeys {
  static const int home = 0;
  static const int store = 1;
}

class NavItem {
  final int navKey;
  final GetPage getPage;
  NavItem({required this.navKey, required this.getPage});
  PageRoute generateRoute(RouteSettings settings) {
    return GetPageRoute(
        page: getPage.page, routeName: getPage.name, binding: getPage.binding);
  }
}

class NavItemData {
  final String name;
  final IconData icon;
  final String route;
  final NavItem navItem;
  NavItemData(
      {required this.name,
      required this.icon,
      required this.navItem,
      required this.route});
}

class NavData {
  final List<NavItemData> myData = [
    NavItemData(
      name: 'home',
      route: Routes.home,
      icon: Icons.home,
      navItem: NavItem(
        navKey: NavKeys.home,
        getPage: GetPage(
          name: Routes.home,
          page: () => const HomeView(),
          // binding: BindingsBuilder.put(() => HomeController()),
        ),
      ),
    ),
    // NavItemData(
    //   name: 'store',
    //   route: Routes.MAP,
    //   icon: Icons.map,
    //   navItem: NavItem(
    //     navKey: NavKeys.MAP,
    //     getPage: GetPage(
    //       name: Routes.MAP,
    //       page: () => MapView(),
    //       binding: BindingsBuilder.put(() => MapController()),
    //     ),
    //   ),
    // ),
  ];
}
