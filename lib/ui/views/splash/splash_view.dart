import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_pos/app/app_config.dart';
import 'package:flutter_pos/ui/views/splash/splash_controller.dart';
import 'package:get/instance_manager.dart';

class SplashView extends StatelessWidget {
  final SplashController _controller = Get.put(SplashController());

  SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            "app_name".tr(),
            style: TextStyle(
                color: AppConfig.instance.primaryColor,
                fontSize: 32,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
