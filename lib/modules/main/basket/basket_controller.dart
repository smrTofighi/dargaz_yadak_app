import 'dart:convert';
import 'dart:developer';
import 'package:car_soare_parts_app/core/utils/api_constant.dart';
import 'package:car_soare_parts_app/core/utils/api_keys.dart';
import 'package:car_soare_parts_app/core/utils/dialogs.dart';
import 'package:car_soare_parts_app/core/utils/snackbars.dart';
import 'package:car_soare_parts_app/core/utils/storage_key.dart';
import 'package:car_soare_parts_app/data/models/basket_model.dart';
import 'package:car_soare_parts_app/data/services/dio_service.dart';
import 'package:car_soare_parts_app/modules/main/profile/profile_controller.dart';
import 'package:car_soare_parts_app/routes/pages.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';

class BasketController extends GetxController {
  RxList<BasketModel> basketList = RxList();
  RxInt totalPrice = 0.obs;
  RxBool isLoading = false.obs;
  TextEditingController descriptionText = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getBasketList();
    sumTotalPrice();
  }

  startBuy() async {
    Future<void> _launchUrl(String url) async {
      if (!await launchUrl(Uri.parse(url),
          mode: LaunchMode.externalApplication)) {
        throw Exception('Could not launch');
      }
    }

    //AppDialogs.loadingDialog();
    final ProfileController profileController = Get.find<ProfileController>();
    var userId = GetStorage().read(StorageKeys.userId);
    String url = ApiConstant.startPaymentApi;
    Map<String, dynamic> map = {
      ApiKeys.apiKey: ApiConstant.apiKey,
      ApiKeys.currentUser: userId,
      ApiKeys.userId: userId,
      ApiKeys.price: (totalPrice.value * 10).toString(),
      ApiKeys.fullName: profileController.userModel.value.fullName.toString(),
      ApiKeys.address: profileController.userModel.value.address.toString(),
      ApiKeys.postalCode:
          profileController.userModel.value.postalCode.toString(),
      ApiKeys.mobile: profileController.userModel.value.mobile.toString(),
      ApiKeys.nationalCode:
          profileController.userModel.value.nationalCode.toString(),
      ApiKeys.email: 'mrtofxn@gmail.com',
      ApiKeys.paymentType: '1',
      ApiKeys.province: '21',
      ApiKeys.sendType: '2',
      ApiKeys.description: descriptionText.text,
      ApiKeys.sendCost: '0',
    };

    var response = await DioService().postMethod(url, map);
    debugPrint(response.data.toString());
    var zarinpal = jsonDecode(response.data.toString());

    var mainUrl = ApiConstant.payment + zarinpal['data']['authority'];
    _launchUrl(mainUrl);
  }

  getBasketList() async {
    isLoading(true);
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
    isLoading(false);
  }

  sumTotalPrice() {
    totalPrice(0);
    for (var i = 0; i < basketList.length; i++) {
      totalPrice.value += int.parse(basketList[i].price!);
    }
    log(totalPrice.value.toString());
  }

  updateBasketProduct(int index, String id, String count, bool isIncrease,
      BuildContext context) async {
    AppDialogs.loadingDialog();

    isLoading(true);
    String url = ApiConstant.updateBasketProductApi;
    var userId = GetStorage().read(StorageKeys.userId);
    Map<String, dynamic> map = {
      ApiKeys.apiKey: ApiConstant.apiKey,
      ApiKeys.currentUser: userId,
      ApiKeys.productId: id,
      ApiKeys.count: count,
      ApiKeys.userId: userId
    };

    try {
      var response = await DioService().postMethod(url, map);

      if (response.data[ApiKeys.status] == 1) {
        getBasketList();
      }

      sumTotalPrice();
    } on DioException catch (e) {
      if (e.response!.data[ApiKeys.status] == -1) {
        AppSnackBar.showSnackBarError(
            'خطا', e.response!.data['msg'].toString(), context);
      }
    }
    Get.back();

    isLoading(false);
  }

  deleteBasketProduct(String id, int index) async {
    AppDialogs.loadingDialog();
    isLoading(true);
    String url = ApiConstant.deleteBasketProductApi;
    var userId = GetStorage().read(StorageKeys.userId);
    Map<String, dynamic> map = {
      ApiKeys.apiKey: ApiConstant.apiKey,
      ApiKeys.currentUser: userId,
      ApiKeys.userId: userId,
      ApiKeys.productId: id
    };
    Get.back();

    try {
      var response = await DioService().postMethod(url, map);
      if (response.data[ApiKeys.status] == 1) {
        basketList.removeAt(index);
        //getBasketList();
      }
    } on DioException catch (e) {}
    sumTotalPrice();
    isLoading(false);
  }

  registerBasketProduct(String id, String count, BuildContext context) async {
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
    try {
      var response = await DioService().postMethod(url, map);
      if (response.data[ApiKeys.status] == 1) {
        AppSnackBar.showSnackBarSuccess(
            'پیام', 'عملیات با موفقیت انجام شد', context);
        getBasketList();
        sumTotalPrice();
      }
    } on DioException catch (e) {
      if (e.response!.data[ApiKeys.status] == -1) {
        AppSnackBar.showSnackBarError('خطا', e.response!.data['msg'], context);
      }
    }
    Get.back();
  }
}
