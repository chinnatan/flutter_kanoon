import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pos/app/app_config.dart';
import 'package:flutter_pos/ui/shared/theme_config.dart';
import 'package:flutter_pos/ui/shared/ui_config.dart';
import 'package:get/route_manager.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: all32,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: bottom16,
                child: Text(
                  "Kanoon POS",
                  style: TextStyle(color: AppConfig.instance.primaryColor, fontSize: 32, fontWeight: FontWeight.w500)
                ),
              ),
              Container(
                margin: bottom8,
                child: TextField(
                  decoration: ThemeConfig.outlineTextFieldPrimary(
                    "username".tr(),
                  ),
                ),
              ),
              Container(
                margin: bottom16,
                child: TextField(
                  decoration: ThemeConfig.outlineTextFieldPrimary(
                    "password".tr(),
                  ),
                ),
              ),
              SizedBox(
                width: Get.width,
                child: ElevatedButton(
                  onPressed: () => {},
                  child: Text(
                    "login".tr(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
