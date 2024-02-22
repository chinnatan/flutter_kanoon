import 'package:flutter/material.dart';

enum FlavorEnvironment { dev, prd }

class AppConfig {
  FlavorEnvironment? flavorEnvironment;
  String appName = "";
  String baseURL = "";
  MaterialColor primaryColor = const MaterialColor(0xFFA3B18A, <int, Color>{
    50: Color(0xFFA4A4BF),
    100: Color(0xFFA4A4BF),
    200: Color(0xFFA4A4BF),
    300: Color(0xFF9191B3),
    400: Color(0xFF7F7FA6),
    500: Color(0xFFA3B18A),
    600: Color(0xFF929F7C),
    700: Color(0xFF828D6E),
    800: Color(0xFF494980),
    900: Color(0xFF181861),
  });

  static AppConfig _instance = AppConfig(
      flavorEnvironment: FlavorEnvironment.dev, appName: "", baseURL: "");

  factory AppConfig(
      {required FlavorEnvironment flavorEnvironment,
      required String appName,
      required String baseURL}) {
    return AppConfig._internal(flavorEnvironment, appName, baseURL);
  }

  AppConfig._internal(this.flavorEnvironment, this.appName, this.baseURL);

  static AppConfig get instance {
    return _instance;
  }

  static bool isDevelopment() =>
      _instance.flavorEnvironment == FlavorEnvironment.dev;
  static bool isProduction() =>
      _instance.flavorEnvironment == FlavorEnvironment.prd;

  // === Env Develop === //
  static AppConfig dev() {
    return _instance = AppConfig(
        flavorEnvironment: FlavorEnvironment.dev,
        appName: "Dev zKCNT POS",
        baseURL: "");
  }

  // === Env Production === //
  static AppConfig prd() {
    return _instance = AppConfig(
        flavorEnvironment: FlavorEnvironment.prd,
        appName: "Prod zKCNT POS",
        baseURL: "");
  }
}
