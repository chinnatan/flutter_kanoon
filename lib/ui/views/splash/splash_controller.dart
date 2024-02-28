import 'package:dio/dio.dart';
import 'package:flutter_pos/core/network/error_handler.dart';
import 'package:flutter_pos/core/routes/app_routes.dart';
import 'package:flutter_pos/core/services/api_auth_service.dart';
import 'package:flutter_pos/core/services/dio_client.dart';
import 'package:flutter_pos/util/app_util.dart';
import 'package:flutter_pos/util/dialog_util.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class SplashController extends GetxController {
  final log = Logger();
  final APIAuthService _apiClient = APIAuthService(DioClient.createDio());
  final user = AppUtil.getUserInfo();

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 1)).then((value) => refreshToken());
    super.onInit();
  }

  Future<void> checkLogin() async {
    log.i("checkLogin");
    if (user == null) {
      Get.offAllNamed(Routes.login);
    } else {
      Get.offNamed(Routes.root);
    }
  }

  Future<void> refreshToken() async {
    log.i("refreshToken");
    try {
      if (user != null) {
        DialogUtil.showLoadingDialog(Get.overlayContext);
        log.i("refresh token : ${user?.refreshToken}");
        var response = await _apiClient
            .refreshToken(user?.refreshToken ?? "")
            .then((value) {
          return value;
        }).catchError((onError) {
          if (onError is DioException) {
            throw onError;
          }
        });

        if (response.success && AppUtil.getUserInfo() != null) {
          AppUtil.getUserInfo()?.token = response.accessToken;
          AppUtil.getUserInfo()?.token = response.refreshToken;
        }
        Get.offAllNamed(Routes.root);
      } else {
        Get.offAllNamed(Routes.login);
      }
    } on Exception catch (e) {
      Get.back();
      DialogUtil.showErrorSnackbar(ErrorHandler.handle(e).failure.message);
    }
  }
}
