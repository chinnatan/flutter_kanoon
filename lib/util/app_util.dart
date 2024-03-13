import 'package:flutter_pos/core/constant/storage_key_const.dart';
import 'package:flutter_pos/ui/views/login/model/user_info.dart';
import 'package:get_storage/get_storage.dart';

class AppUtil {
  static void setUserInfo(UserInfo? userInfo) {
    var box = GetStorage();
    if (userInfo != null) {
      box.write(StorageKeyConst.user, userInfo);
    }
  }

  static UserInfo? getUserInfo() {
    var box = GetStorage();
    if (box.read(StorageKeyConst.user) != null) {
      return UserInfo.fromJson(box.read(StorageKeyConst.user));
    }
    return null;
  }

  static void clearUserInfo() {
    var box = GetStorage();
    box.remove(StorageKeyConst.user);
  }
}
