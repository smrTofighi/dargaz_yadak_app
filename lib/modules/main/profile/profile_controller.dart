import 'dart:developer';

import 'package:car_soare_parts_app/core/utils/api_constant.dart';
import 'package:car_soare_parts_app/core/utils/api_keys.dart';
import 'package:car_soare_parts_app/core/utils/get_persian_number.dart';
import 'package:car_soare_parts_app/core/utils/storage_key.dart';
import 'package:car_soare_parts_app/data/models/user_model.dart';
import 'package:car_soare_parts_app/data/services/dio_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  Rx<UserModel> userModel = UserModel().obs;
  @override
  onInit() {
    getUserInfo();
    super.onInit();
  }

  updateUserInfo(String fullName, String address, String postalCode,
      String nationalCode, String provinceCode, String password) async {
    String url = ApiConstant.updateUserProfileApi;
    var userId = await GetStorage().read(StorageKeys.userId);
    Map<String, dynamic> map = {
      ApiKeys.apiKey: ApiConstant.apiKey,
      ApiKeys.userId: userId.toString(),
      ApiKeys.currentUser: userId.toString(),
      ApiKeys.fullName: fullName,
      ApiKeys.address: address,
      ApiKeys.postalCode: postalCode,
      ApiKeys.nationalCode: nationalCode,
      ApiKeys.provinceId: provinceCode,
      ApiKeys.password: password
    };

    var response = await DioService().postMethod(url, map);
    log(response.data[ApiKeys.status].toString());

    if (response.data[ApiKeys.status] == 1) {
      userModel.update((val) {
        val!.fullName = fullName;
        val.address = address;
        val.postalCode = postalCode;
        val.nationalCode = val.nationalCode;
        val.provinceId = provinceCode;
      });
    }
  }

  getUserInfo() async {
    String url = ApiConstant.getUserProfileApi;
    var userId = await GetStorage().read(StorageKeys.userId);
    Map<String, dynamic> map = {
      ApiKeys.apiKey: ApiConstant.apiKey,
      ApiKeys.userId: userId,
      ApiKeys.currentUser: userId,
    };

    var response = await DioService().postMethod(url, map);
    if (response.data[ApiKeys.status] == 1) {
      var user = response.data[ApiKeys.user];
      log(user[ApiKeys.fullName].toString());
      userModel.update((val) {
        val!.fullName = user[ApiKeys.fullName];
        val.mobile = getPersianNumber(user[ApiKeys.mobile] ?? '0');

        val.address = user[ApiKeys.address] ?? 'خالی';
        val.postalCode = getPersianNumber(user[ApiKeys.postalCode] ?? '0');
        val.nationalCode = getPersianNumber(user[ApiKeys.nationalCode] ?? '0');
        val.provinceId = getPersianNumber(user[ApiKeys.provinceId].toString());
      });
    }
  }
}
