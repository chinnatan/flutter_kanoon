import 'package:flutter/material.dart';

enum FlavorEnvironment { dev, prd }

class AppConfig {
  late final FlavorEnvironment flavorEnvironment;
  String appName = "";
  String baseURL = "";
  MaterialColor primaryColor = const MaterialColor(0x588157, {
    
  });

  static AppConfig? _instance;

  factory AppConfig({required FlavorEnvironment flavorEnvironment, required String appName, required String baseURL}) {
    return _instance ?? AppConfig._internal(flavorEnvironment, appName, baseURL);
  }

  AppConfig._internal(this.flavorEnvironment, this.appName, this.baseURL);

  static AppConfig? get instance {
    return _instance;
  }

  static bool isDevelopment() => _instance?.flavorEnvironment == FlavorEnvironment.dev;
  static bool isProduction() => _instance?.flavorEnvironment == FlavorEnvironment.prd;

  // === Env Develop === //
  static AppConfig dev() {
   return AppConfig(flavorEnvironment: FlavorEnvironment.dev, appName: "Dev zKCNT POS", baseURL: "");
  }

  // === Env Production === //
  static AppConfig prd() {
   return AppConfig(flavorEnvironment: FlavorEnvironment.dev, appName: "Prod zKCNT POS", baseURL: "");
  }
}
