import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pos/ui/views/home/home_view.dart';
import 'package:flutter_pos/ui/views/main/controller/main_controller.dart';
import 'package:get/state_manager.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("app_name".tr()),
      ),
      bottomNavigationBar: Obx(
        () {
          return BottomNavigationBar(
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex.value,
            items: [
              BottomNavigationBarItem(
                label: "bottom_nav.home".tr(),
                icon: Icon(Icons.home_rounded),
              ),
              BottomNavigationBarItem(
                label: "bottom_nav.store".tr(),
                icon: Icon(Icons.store_rounded),
              ),
            ],
          );
        },
      ),
      body: Obx(
        () {
          return IndexedStack(
            index: controller.tabIndex.value,
            children: [
              HomeView(),
            ],
          );
        },
      ),
    );
  }
}
