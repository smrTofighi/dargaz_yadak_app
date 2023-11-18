import 'dart:developer';
import 'package:car_soare_parts_app/core/utils/api_constant.dart';
import 'package:car_soare_parts_app/core/utils/api_keys.dart';
import 'package:car_soare_parts_app/core/utils/dialogs.dart';
import 'package:car_soare_parts_app/core/utils/snackbars.dart';
import 'package:car_soare_parts_app/core/utils/storage_key.dart';
import 'package:car_soare_parts_app/data/models/basket_model.dart';
import 'package:car_soare_parts_app/data/services/dio_service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class BasketController extends GetxController {
  RxList<BasketModel> basketList = RxList();
  RxInt totalPrice = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getBasketList();
    sumTotalPrice();
  }

  getBasketList() async {
    basketList.clear();
    String url = ApiConstant.getBasketProductApi;
    var userId = GetStorage().read(StorageKeys.userId);
    Map<String, dynamic> map = {
      ApiKeys.apiKey: ApiConstant.apiKey,
      ApiKeys.currentUser: userId,
      ApiKeys.userId: userId
    };
    var response = await DioService().postMethod(url, map);
    if (response.data[ApiKeys.status] == 1) {
      response.data['basket'].forEach((product) {
        basketList.add(BasketModel.fromJson(product));
      });
    }
    sumTotalPrice();
  }

  sumTotalPrice() {
    totalPrice(0);
    for (var i = 0; i < basketList.length; i++) {
      totalPrice.value += int.parse(basketList[i].price!);
    }
    log(totalPrice.value.toString());
  }

  updateBasketProduct(
      int index, String id, String count, bool isIncrease) async {
    AppDialogs.loadingDialog();
    String url = ApiConstant.updateBasketProductApi;
    var userId = GetStorage().read(StorageKeys.userId);
    Map<String, dynamic> map = {
      ApiKeys.apiKey: ApiConstant.apiKey,
      ApiKeys.currentUser: userId,
      ApiKeys.productId: id,
      ApiKeys.count: count,
      ApiKeys.userId: userId
    };

    var response = await DioService().postMethod(url, map);
    Get.back();
    try {
      if (response.data[ApiKeys.status] == 1) {
        getBasketList();
      }
      sumTotalPrice();
    } on DioException catch (e) {
      if (e.response!.data[ApiKeys.status] == -1) {
        AppSnackBar.showSnackBar('خطا', e.response!.data['msg']);
      }
    }
  }

  deleteBasketProduct(String id, int index) async {
    AppDialogs.loadingDialog();
    String url = ApiConstant.deleteBasketProductApi;
    var userId = GetStorage().read(StorageKeys.userId);
    Map<String, dynamic> map = {
      ApiKeys.apiKey: ApiConstant.apiKey,
      ApiKeys.currentUser: userId,
      ApiKeys.userId: userId,
      ApiKeys.productId: id
    };

    try {
      var response = await DioService().postMethod(url, map);
      if (response.data[ApiKeys.status] == 1) {
        basketList.removeAt(index);
        //getBasketList();
      }
    } on DioException catch (e) {}
    sumTotalPrice();
    Get.back();
  }

  registerBasketProduct(String id, String count) async {
    AppDialogs.loadingDialog();
    var userId = GetStorage().read(StorageKeys.userId);
    String url = ApiConstant.registerBasketProductApi;
    Map<String, dynamic> map = {
      ApiKeys.apiKey: ApiConstant.apiKey,
      ApiKeys.currentUser: userId,
      ApiKeys.productId: id,
      ApiKeys.count: count,
      ApiKeys.userId: userId
    };
    Get.back();
    try {
      var response = await DioService().postMethod(url, map);
      if (response.data[ApiKeys.status] == 1) {
        AppSnackBar.showSnackBar('پیام', 'عملیات با موفقیت انجام شد');
        getBasketList();
        sumTotalPrice();
      }
    } on DioException catch (e) {
      if (e.response!.data[ApiKeys.status] == -1) {
        AppSnackBar.showSnackBar('خطا', e.response!.data['msg']);
      }
    }
  }
}
