import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pos/core/routes/app_routes.dart';
import 'package:flutter_pos/ui/views/home/home_view.dart';
import 'package:flutter_pos/ui/views/main/main_controller.dart';
import 'package:flutter_pos/util/app_util.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class MainView extends StatelessWidget {
  final MainController _controller = Get.put(MainController());
  MainView({super.key});

  buildBottomNav() {
    return Obx(
      () {
        return BottomNavigationBar(
          onTap: _controller.changeTabIndex,
          currentIndex: _controller.tabIndex.value,
          items: [
            BottomNavigationBarItem(
              label: "bottom_nav.home".tr(),
              icon: const Icon(Icons.home_rounded),
            ),
            BottomNavigationBarItem(
              label: "bottom_nav.store".tr(),
              icon: const Icon(Icons.store_rounded),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("app_name").tr(),
        actions: [
          IconButton(
            onPressed: () {
              AppUtil.clearUserInfo();
              Get.offAllNamed(Routes.splash);
            },
            icon: const Icon(
              Icons.logout_rounded,
            ),
          )
        ],
      ),
      bottomNavigationBar: buildBottomNav(),
      body: Obx(
        () {
          return IndexedStack(
            index: _controller.tabIndex.value,
            children: const [
              HomeView(),
            ],
          );
        },
      ),
    );
  }
}
