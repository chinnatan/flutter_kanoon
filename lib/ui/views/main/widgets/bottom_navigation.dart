import 'package:flutter/material.dart';
import 'package:flutter_pos/ui/views/main/controller/main_controller.dart';
import 'package:get/state_manager.dart';

class BottomNavBar extends GetView<MainController> {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        onTap: controller.changeTabIndex,
        currentIndex: controller.tabIndex.value,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.safety_check),
          ),
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.safety_check),
          ),
        ],
      ),
    );
  }
}
