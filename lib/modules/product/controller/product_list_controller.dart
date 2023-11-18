import 'dart:developer';

import 'package:car_soare_parts_app/core/utils/api_constant.dart';
import 'package:car_soare_parts_app/core/utils/api_keys.dart';
import 'package:car_soare_parts_app/data/models/product_model.dart';
import 'package:car_soare_parts_app/data/services/dio_service.dart';
import 'package:car_soare_parts_app/routes/pages.dart';
import 'package:get/get.dart';

class ProductListController extends GetxController {
  RxString titleAppBar = RxString('');
  RxList<ProductModel> productList = RxList();
  RxList<String> brandIdList = RxList();
  RxList<String> categoryIdList = RxList();
  RxInt brandId = 0.obs;
  RxInt categoryId = 0.obs;
  RxInt page = 1.obs;
  RxInt maxPage = 0.obs;
  RxBool isBrand = false.obs;
  RxBool loading = false.obs;
  RxDouble maxPrice = 50000000.0.obs;
  RxDouble minPrice = 10000.0.obs;

  getProductList() async {
    loading.value = true;
    String url = ApiConstant.getProductListApi;
    Map<String, dynamic> map = {
      ApiKeys.apiKey: ApiConstant.apiKey,
      ApiKeys.categories: categoryIdList.isEmpty
          ? null
          : categoryIdList.length == 1
              ? categoryIdList[0]
              : categoryIdList,
      ApiKeys.brands: brandIdList.isEmpty
          ? null
          : brandIdList.length == 1
              ? brandIdList[0]
              : brandIdList,
      ApiKeys.minPrice: '0',
      ApiKeys.maxPrice: '1000000000',
      ApiKeys.sortBy: 'id-asc',
      ApiKeys.page: page.value.toString()
    };
  }

  getProductBrand() async {
    loading.value = true;
    String url = ApiConstant.getProductListApi;
    Map<String, dynamic> map = {
      ApiKeys.apiKey: ApiConstant.apiKey,
      ApiKeys.categories: null,
      ApiKeys.brands: brandId.value.toString(),
      ApiKeys.minPrice: '0',
      ApiKeys.maxPrice: '1000000000',
      ApiKeys.sortBy: 'id-asc',
      ApiKeys.page: page.value.toString()
    };
    var response = await DioService().postMethod(url, map);

    if (response.data[ApiKeys.status] == 1) {
      maxPage.value =
          response.data[ApiKeys.productResponse][ApiKeys.numberOfPage];
      response.data[ApiKeys.productResponse][ApiKeys.products]
          .forEach((product) {
        productList.add(ProductModel.fromJson(product));
      });
    }
    if (response.data[ApiKeys.status] == -1) {
      log('-1');
    }
    Get.toNamed(NamePages.productListPage);

    loading.value = false;
  }

  getProductCategory() async {
    loading.value = true;
    String url = ApiConstant.getProductListApi;
    Map<String, dynamic> map = {
      ApiKeys.apiKey: ApiConstant.apiKey,
      ApiKeys.categories: categoryId.value.toString(),
      ApiKeys.brands: null,
      ApiKeys.minPrice: '0',
      ApiKeys.maxPrice: '1000000000',
      ApiKeys.sortBy: 'id-asc',
      ApiKeys.page: page.value.toString()
    };
    var response = await DioService().postMethod(url, map);
    switch (response.data[ApiKeys.status]) {
      case 1:
        maxPage.value =
            response.data[ApiKeys.productResponse][ApiKeys.numberOfPage];
        response.data[ApiKeys.productResponse][ApiKeys.products]
            .forEach((product) {
          productList.add(ProductModel.fromJson(product));
        });
        break;
    }
    Get.toNamed(NamePages.productListPage);

    loading.value = false;
  }
}
