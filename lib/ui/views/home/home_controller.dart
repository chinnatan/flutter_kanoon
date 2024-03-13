import 'package:flutter_pos/core/constant/storage_key_const.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

class HomeController extends GetxController {
  final log = Logger();
  final box = GetStorage();

  var fullname = "".obs;
  var storeName = "".obs;

  @override
  void onInit() {
    getInfo();
    super.onInit();
  }

  Future<void> getInfo() async {
    var user = box.read(StorageKeyConst.user);
    if (user != null) {
      fullname.value = user.fullname ?? "";
      storeName.value = user.storeName ?? "";
    }
  }
}
