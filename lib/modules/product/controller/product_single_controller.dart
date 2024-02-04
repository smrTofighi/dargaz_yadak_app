import 'dart:developer';

import 'package:car_soare_parts_app/core/utils/api_constant.dart';
import 'package:car_soare_parts_app/core/utils/api_keys.dart';
import 'package:car_soare_parts_app/core/utils/dialogs.dart';
import 'package:car_soare_parts_app/core/utils/snackbars.dart';
import 'package:car_soare_parts_app/data/models/category_model.dart';
import 'package:car_soare_parts_app/data/models/comment_model.dart';
import 'package:car_soare_parts_app/data/models/image_model.dart';
import 'package:car_soare_parts_app/data/models/product_model.dart';
import 'package:car_soare_parts_app/data/services/dio_service.dart';
import 'package:car_soare_parts_app/modules/main/basket/basket_controller.dart';
import 'package:car_soare_parts_app/modules/main/profile/profile_controller.dart';
import 'package:car_soare_parts_app/routes/pages.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProductSingleController extends GetxController {
  Rx<ProductModel> productModel = ProductModel().obs;
  Rx<ImageModel> imageModel = ImageModel().obs;
  Rx<CategoryModel> categoryModel = CategoryModel().obs;
  RxInt productId = RxInt(0);
  RxBool loading = false.obs;

  RxList<CommentModel> commentList = RxList();

  void getProductComments() async {
    String url = ApiConstant.getProductComments;
    Map<String, dynamic> map = {
      ApiKeys.apiKey: ApiConstant.apiKey,
      //TODO" remeber use productId
      ApiKeys.productId: 277
    };

    try {
      var response = await DioService().postMethod(url, map);
      if (response.data[ApiKeys.status] == 1) {
        response.data['comments'].forEach((comment) {
          commentList.add(CommentModel.fromJson(comment));
        });
      }
    } on DioException catch (e) {
      log(e.toString());
    }
  }

  getProduct() async {
    loading.value = true;
    String url = ApiConstant.getProductApi;
    Map<String, dynamic> map = {
      ApiKeys.apiKey: ApiConstant.apiKey,
      ApiKeys.productId: productId.value.toString()
    };
    var response = await DioService().postMethod(url, map);
    if (response.data[ApiKeys.status] == 1) {
      productModel.value =
          ProductModel.fromJson(response.data[ApiKeys.product]);
      imageModel.value = ImageModel.fromJson(response.data[ApiKeys.indexImage]);
      //  categoryModel.value = CategoryModel.fromJson(
      //      response.data[ApiKeys.product][ApiKeys.category]);
    }
    Get.toNamed(NamePages.productSinglePage);
    loading.value = false;
  }

  addCommentProduct(String email, String comment,context) async {
    Get.back();
    AppDialogs.loadingDialog();
    String url = ApiConstant.submitProductComment;
    Map<String, dynamic> map = {
      ApiKeys.apiKey: ApiConstant.apiKey,
      ApiKeys.productId: productModel.value.id.toString(),
      ApiKeys.email: email,
      ApiKeys.fullName: Get.find<ProfileController>().userModel.value.fullName,
      ApiKeys.comment: comment
    };

    var response = await DioService().postMethod(url, map);

    log(response.toString());
    Get.back();

    if (response.data[ApiKeys.status] == 1) {
      AppSnackBar.showSnackBarSuccess('', '${response.data['msg']}', context);
    }
  }

  addProductToBasketList(String id, String count, BuildContext context) {
    BasketController basketController = Get.find<BasketController>();
    basketController.registerBasketProduct(id, count, context);
  }
}
