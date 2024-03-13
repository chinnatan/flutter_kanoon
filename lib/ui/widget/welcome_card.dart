import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pos/app/app_config.dart';
import 'package:flutter_pos/ui/shared/theme_config.dart';
import 'package:flutter_pos/ui/shared/ui_config.dart';
import 'package:get/route_manager.dart';

class WelcomeCard extends StatelessWidget {
  final String fullName;
  final String storeName;

  const WelcomeCard(
      {super.key, required this.fullName, required this.storeName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Card(
        elevation: 5.0,
        shape: const RoundedRectangleBorder(
          borderRadius: boderRadiusAll10,
        ),
        color: AppConfig.instance.primaryColor.shade200,
        child: Padding(
          padding: all16,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("hello".tr(), style: ThemeConfig.titleMedium()),
                  Container(
                    margin: left8,
                    child: Text(
                      fullName,
                      style: ThemeConfig.titleMedium(),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "store".tr(),
                    style: ThemeConfig.titleLarge(),
                  ),
                  Container(
                    margin: left8,
                    child: Text(
                      storeName,
                      style: ThemeConfig.titleLarge(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
