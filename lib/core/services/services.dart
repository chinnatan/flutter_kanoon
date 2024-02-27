import 'package:get/get.dart';

abstract class AppServices {
  static Future<void> init() async {
    /// order matters.
    // await Get.put(StorageService()).init();
    // await Get.put(FirebaseService()).init();
    // await Get.put(ApiCacheService()).init();
    // await Get.put(ApiService()).init();
    // await Get.put(SessionService()).init();
    // await Get.put(SettingsService()).init();

    /// request for notifications permissions.
    // await FirebaseService.get().initFCM();

    // _initRepositories();
  }

  // static void _initRepositories() {
  //   /// if we need repositories, register here.
  //   Get.lazyPut(() => HomeRepo());
  // }
}

abstract class BaseService {
  Future<void> init() async {}
}