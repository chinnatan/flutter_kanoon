import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Text("app_name".tr()),
      ),
    );
  }
}
