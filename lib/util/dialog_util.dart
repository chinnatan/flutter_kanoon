import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pos/core/exceptions/app_exceptions.dart';
import 'package:flutter_pos/ui/shared/ui_config.dart';
import 'package:get/route_manager.dart';

class DialogUtil {
  static Future<void> showLoadingDialog(BuildContext? context) async {
    return showDialog(
      context: context!,
      barrierDismissible: false,
      builder: ((context) {
        return PopScope(
          canPop: false,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
          onPopInvoked: (didPop) async {
            if (didPop) {
              return;
            }
          },
        );
      }),
    );
  }

  static Future<void> showErrorDialog(
      BuildContext? context, AppException exception) async {
    return showDialog(
      context: context!,
      barrierDismissible: false,
      builder: ((context) {
        String? message;

        if (exception is InvalidInputException) {
          InvalidInputException invalidInputException = exception;
          message = invalidInputException.message;
        }

        return AlertDialog(
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(borderRadius: boderRadiusAll10),
          title: Text("title_notify".tr()),
          content: SingleChildScrollView(
            child: Column(
              children: [Text(message!)],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("title_close".tr()))
          ],
        );
      }),
    );
  }

  static void showErrorSnackbar(String message) {
    Get.snackbar(
      "title_notify".tr(),
      message,
      borderRadius: 10,
      margin: all8,
      snackPosition: SnackPosition.TOP,
      icon: const Icon(
        Icons.warning_rounded,
        color: Colors.red,
        size: 24.0,
      ),
    );
  }
}
