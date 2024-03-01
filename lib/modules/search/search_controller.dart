import 'dart:developer';

import 'package:car_soare_parts_app/core/utils/api_constant.dart';
import 'package:car_soare_parts_app/core/utils/api_keys.dart';
import 'package:car_soare_parts_app/data/models/search_model.dart';
import 'package:car_soare_parts_app/data/services/dio_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchProductController extends GetxController {
  final TextEditingController searchTextController = TextEditingController();
  RxList<SearchModel> searchList = RxList();
  RxBool loading = RxBool(false);

  searchProduct() async {
    loading(true);
    Map<String, dynamic> map = {
      ApiKeys.apiKey: ApiConstant.apiKey,
      'query': searchTextController.text,
    };
    const String url = ApiConstant.searchProductApi;
    searchList.clear();
    try {
      var response = await DioService().postMethod(url, map);
      if (response.data[ApiKeys.status] == 1) {
        response.data[ApiKeys.productsResult].forEach((product){
          searchList.add(SearchModel.fromJson(product));
          
        });
        log(searchList[0].image.path.toString());
      }
    } on DioException catch (error) {
      if (error.response!.data[ApiKeys.status] == -1) {

      }
    }
    loading(false);
  }
}
