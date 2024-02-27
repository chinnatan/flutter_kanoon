import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_pos/core/constant/storage_key_const.dart';
import 'package:flutter_pos/core/exceptions/app_exceptions.dart';
import 'package:flutter_pos/core/services/api_auth_service.dart';
import 'package:flutter_pos/core/services/dio_client.dart';
import 'package:flutter_pos/core/services/request/login_rq.dart';
import 'package:flutter_pos/util/dialog_util.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final APIAuthService _apiClient = APIAuthService(DioClient.createDio());

  var username = "".obs();
  var password = "".obs();

  Future<void> login() async {
    try {
      if (username.isEmpty || password.isEmpty) {
        throw InvalidInputException("msg_err_input_user_or_pass".tr());
      }

      DialogUtil.showLoadingDialog(Get.overlayContext);
      var response = await _apiClient
          .login(LoginRq(username: username, password: password));

      if (!response.success) {
        throw InvalidInputException(response.message);
      }

      await GetStorage().write(StorageKeyConst.user, response.result);
      Get.offAllNamed('/');
    } on InvalidInputException catch (e) {
      Get.back();
      DialogUtil.showErrorSnackbar(e);
    } on Exception catch (e) {
      Get.back();
      print(e);
    }
  }
}
