import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pos/app/app_config.dart';
import 'package:flutter_pos/core/routes/app_pages.dart';
import 'package:flutter_pos/ui/shared/ui_config.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppConfig.instance.primaryColor));
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConfig.instance.appName,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          primary: AppConfig.instance.primaryColor,
        ),
        primaryColor: AppConfig.instance.primaryColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppConfig.instance.primaryColor,
            foregroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: boderRadiusAll10,
            ),
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
    );
  }
}
