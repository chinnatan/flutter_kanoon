import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pos/app/app_config.dart';
import 'package:flutter_pos/ui/shared/theme_config.dart';
import 'package:flutter_pos/ui/shared/ui_config.dart';
import 'package:flutter_pos/ui/views/home/home_controller.dart';
import 'package:flutter_pos/ui/widget/welcome_card.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class HomeView extends GetView<HomeController> {
  final HomeController _controller = Get.put(HomeController());
  HomeView({super.key});

  buildSectionOne(BuildContext context) {
    return Container(
      width: Get.width,
      height: 50,
      margin: top8,
      child: Card(
        color: AppConfig.instance.primaryColor.shade200,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: all16,
            child: Column(
              children: [
                Obx(
                  () => WelcomeCard(
                      fullName: controller.fullname.value,
                      storeName: controller.storeName.value),
                ),
                buildSectionOne(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
