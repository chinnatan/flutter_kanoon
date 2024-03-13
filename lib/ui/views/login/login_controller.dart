import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_pos/core/constant/storage_key_const.dart';
import 'package:flutter_pos/core/exceptions/app_exceptions.dart';
import 'package:flutter_pos/core/network/error_handler.dart';
import 'package:flutter_pos/core/routes/app_routes.dart';
import 'package:flutter_pos/core/services/api_auth_service.dart';
import 'package:flutter_pos/core/services/dio_client.dart';
import 'package:flutter_pos/core/services/request/login_rq.dart';
import 'package:flutter_pos/util/app_util.dart';
import 'package:flutter_pos/util/dialog_util.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final APIAuthService _apiClient = APIAuthService(DioClient.createDio());

  var username = "".obs();
  var password = "".obs();

  void login() async {
    try {
      if (username.isEmpty || password.isEmpty) {
        throw InvalidInputException("msg_err_input_user_or_pass".tr());
      }

      DialogUtil.showLoadingDialog(Get.overlayContext);
      // var loginRs = await _apiClient
      //     .login(LoginRq(username: username, password: password))
      //     .then((value) {
      //   final box = GetStorage();
      //   box.write(StorageKeyConst.user, value.result);
      //   Get.offAllNamed(Routes.root);
      // }).catchError((onError) => throw onError);

      var loginRs = await _apiClient
          .login(LoginRq(username: username, password: password));

      if (loginRs.success) {
        final box = GetStorage();
        box.write(StorageKeyConst.user, loginRs.result);
        Get.offAllNamed(Routes.root);
      }
    } on Exception catch (e) {
      Get.back();
      DialogUtil.showErrorSnackbar(ErrorHandler.handle(e).failure.message);
    }
  }
}
