import 'package:dio/dio.dart';
import 'package:flutter_pos/core/constant/storage_key_const.dart';
import 'package:flutter_pos/core/network/error_handler.dart';
import 'package:flutter_pos/core/routes/app_routes.dart';
import 'package:flutter_pos/core/services/api_auth_service.dart';
import 'package:flutter_pos/core/services/dio_client.dart';
import 'package:flutter_pos/ui/views/login/model/user_info.dart';
import 'package:flutter_pos/util/dialog_util.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

class SplashController extends GetxController {
  final log = Logger();
  final APIAuthService _apiClient = APIAuthService(DioClient.createDio());
  final box = GetStorage();
  UserInfo? _userInfo;

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 1)).then((value) => refreshToken());
    super.onInit();
  }

  Future<void> refreshToken() async {
    log.i("refreshToken");
    try {
      var userStorage = box.read(StorageKeyConst.user);
      if (userStorage != null) {
        _userInfo = UserInfo.fromJson(userStorage);
      }

      if (_userInfo != null) {
        DialogUtil.showLoadingDialog(Get.overlayContext);
        await _apiClient
            .refreshToken("Bearer ${_userInfo?.refreshToken}")
            .then((value) {
          if (value.success && _userInfo != null) {
            _userInfo?.token = value.result?.accessToken;
            _userInfo?.refreshToken = value.result?.refreshToken;
            box.write(StorageKeyConst.user, _userInfo);
          }
          Get.offAllNamed(Routes.root);
        }).catchError((onError) {
          if (onError is DioException) {
            throw onError;
          }
        });
      } else {
        Get.offAllNamed(Routes.login);
      }
    } on Exception catch (e) {
      Get.back();
      DialogUtil.showErrorSnackbar(ErrorHandler.handle(e).failure.message);
    }
  }
}
