import 'package:flutter_pos/core/constant/storage_key_const.dart';
import 'package:flutter_pos/ui/views/login/model/user_info.dart';
import 'package:get_storage/get_storage.dart';

class AppUtil {
  static GetStorage? _box;

  static Future<void> setUserInfo(UserInfo? userInfo) async {
    _box ??= GetStorage();
    if (userInfo != null) {
      await _box?.write(StorageKeyConst.user, userInfo);
    }
  }

  static UserInfo? getUserInfo() {
    _box ??= GetStorage();
    if (_box != null) {
      if (_box?.read(StorageKeyConst.user) != null) {
        return UserInfo.fromJson(_box?.read(StorageKeyConst.user));
      }
    }
    return null;
  }

  static void clearUserInfo() {
    _box ??= GetStorage();
    _box?.remove(StorageKeyConst.user);
  }
}
