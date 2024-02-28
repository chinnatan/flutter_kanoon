import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pos/app/app_config.dart';
import 'package:get_storage/get_storage.dart';

import 'app/app.dart';

void main() async {
  AppConfig.dev();

  WidgetsFlutterBinding.ensureInitialized();
  // === init GetStorage === //
  await GetStorage.init();

  runApp(
    EasyLocalization(
      startLocale: const Locale('th', 'TH'),
      supportedLocales: const [Locale('en', 'US'), Locale('th', 'TH')],
      fallbackLocale: const Locale('th', 'TH'),
      saveLocale: true,
      path: 'assets/locales',
      child: const MyApp(),
    ),
  );
}
