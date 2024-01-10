import 'dart:developer';
import 'dart:io';

import 'package:car_soare_parts_app/core/utils/api_constant.dart';
import 'package:car_soare_parts_app/core/utils/api_keys.dart';
import 'package:car_soare_parts_app/core/utils/dialogs.dart';
import 'package:car_soare_parts_app/core/utils/snackbars.dart';
import 'package:car_soare_parts_app/core/utils/storage_key.dart';
import 'package:car_soare_parts_app/data/services/dio_service.dart';
import 'package:car_soare_parts_app/routes/pages.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RegisterController extends GetxController {
  RxBool statusConnection = true.obs;
  Future<bool> checkConnectivity() async {
    statusConnection.value = true;
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  logOutUser() {
    AppDialogs.loadingDialog();
    GetStorage().remove(StorageKeys.token);
    GetStorage().remove(StorageKeys.userId);
    Future.delayed(const Duration(milliseconds: 500))
        .then((value) => Get.offAllNamed(NamePages.loginPage));
  }

  checkUserIsLogin() {
    log((GetStorage().read(StorageKeys.userId).toString()));
    debugPrint((GetStorage().read(StorageKeys.token).toString()));
    if (GetStorage().read(StorageKeys.token) == null) {
      Get.offNamed(NamePages.loginPage);
    } else {
      Get.offNamed(NamePages.mainPage);
    }
  }

  logInUser(String phone, String password, BuildContext context) async {
    AppDialogs.loadingDialog();
    Map<String, dynamic> map = {
      ApiKeys.apiKey: ApiConstant.apiKey,
      ApiKeys.username: phone,
      ApiKeys.password: password
    };
    var url = ApiConstant.loginApi;
    try {
      var response = await DioService().postMethod(url, map);
      if (response.data[ApiKeys.status] == 1) {
        String token = response.data[ApiKeys.token];
        int userId = response.data[ApiKeys.userId];

        GetStorage().write(StorageKeys.token, token);
        GetStorage().write(StorageKeys.userId, userId);

        Get.back();
        Get.offNamed(NamePages.mainPage);
      }
    } on DioException catch (e) {
      if (e.response!.data[ApiKeys.status] == -1) {
        String errorMessage = e.response!.data['msg'].toString();
        Get.back();
        AppSnackBar.showSnackBarError('خطا', errorMessage, context);
      }
    }
  }

  registerUser(String name, String phone, String password, BuildContext context) async {
    AppDialogs.loadingDialog();
    Map<String, dynamic> map = {
      ApiKeys.apiKey: ApiConstant.apiKey,
      ApiKeys.mobile: phone,
      ApiKeys.password: password,
      ApiKeys.fullName: name
    };
    String url = ApiConstant.registerApi;
    try {
      var response = await DioService().postMethod(url, map);
      Get.back();
      if (response.data[ApiKeys.status] == 1) {
        AppSnackBar.showSnackBarSuccess('پیغام', 'ثبت نام با موفقیت انجام شد', context);
        Get.offNamed(NamePages.loginPage);
      }
      if (response.statusCode == 400) {
        String messageError =
            response.data[ApiKeys.response][ApiKeys.mobile][0];
        log(messageError);
      }
    } on DioException catch (e) {
      log(e.response!.data[ApiKeys.status].toString());

      if (e.response!.data[ApiKeys.status] == -1) {
        String messageError =
            e.response!.data[ApiKeys.response][ApiKeys.mobile][0];
        Get.back();
        AppSnackBar.showSnackBarError('خطا', messageError, context);
      }
    }
  }
}
