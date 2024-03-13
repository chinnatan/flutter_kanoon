import 'package:flutter/material.dart';

enum FlavorEnvironment { dev, prd }

class AppConfig {
  FlavorEnvironment? flavorEnvironment;
  String appName = "";
  String baseURL = "";
  MaterialColor primaryColor = const MaterialColor(0xFF84A59D, <int, Color>{
    50: Color(0xFFE2F1EF),
    100: Color(0xFFC6DAD3),
    200: Color(0xFFA5BFB8),
    300: Color(0xFF84A59D),
    400: Color(0xFF6B9188),
    500: Color(0xFF84A59D),
    600: Color(0xFF486E65),
    700: Color(0xFF395A53),
    800: Color(0xFF2B4741),
    900: Color(0xFF1B322D),
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
        appName: "Kanoon Dev",
        baseURL: "http://localhost:3000/");
  }

  // === Env Production === //
  static AppConfig prd() {
    return _instance = AppConfig(
        flavorEnvironment: FlavorEnvironment.prd,
        appName: "Kanoon Prod",
        baseURL: "");
  }
}
