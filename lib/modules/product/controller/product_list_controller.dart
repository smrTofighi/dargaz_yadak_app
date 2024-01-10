import 'dart:developer';

import 'package:car_soare_parts_app/core/utils/api_constant.dart';
import 'package:car_soare_parts_app/core/utils/api_keys.dart';
import 'package:car_soare_parts_app/data/models/product_model.dart';
import 'package:car_soare_parts_app/data/services/dio_service.dart';
import 'package:car_soare_parts_app/routes/pages.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ProductListController extends GetxController {
  RxString titleAppBar = RxString('');
  RxList<ProductModel> productList = RxList();
  RxList<String> brandIdList = RxList();
  RxList<String> categoryIdList = RxList();
  RxInt brandId = 0.obs;
  RxInt categoryId = 0.obs;
  RxInt page = 1.obs;
  RxBool hasNextPage = RxBool(true);
  RxInt maxPage = RxInt(0);
  int limit = 10;
  RxBool loading2 = false.obs;
  RxBool loading = false.obs;
  RxDouble maxPrice = 50000000.0.obs;
  RxDouble minPrice = 10000.0.obs;
  PagingController<int, ProductModel> pagingController =
      PagingController(firstPageKey: 1);

  @override
  void onInit() {
    super.onInit();
  }

  loadMore() async {
    if (hasNextPage.value &&
        loading.value == false &&
        loading2.value == false) {
      loading2(true);
      page(page.value + 1);
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
      try {
        var response = await DioService().postMethod(url, map);
        if (response.data[ApiKeys.status] == 1) {
          response.data[ApiKeys.productResponse][ApiKeys.products]
                .forEach((product) {
              productList.add(ProductModel.fromJson(product));
            });
          if (page.value >= maxPage.value) {
            hasNextPage(false);
          } 
          
        }
      } on DioException catch (error) {}

      loading2(false);
    }
  }

  Future<void> fetchPage(int pageKey, Map<String, dynamic> map) async {
    String url = ApiConstant.getProductListApi;

    List<ProductModel> list = [];
    try {
      list.clear();
      var response = await DioService().postMethod(url, map);
      if (response.data[ApiKeys.status] == 1) {
        response.data[ApiKeys.productResponse][ApiKeys.products]
            .forEach((product) {
          list.add(ProductModel.fromJson(product));
        });
        final isLastPage = list.length < 10;
        if (isLastPage) {
          pagingController.appendLastPage(list);
        } else {
          page(page.value + 1);
          Map<String, dynamic> map2 = {
            ApiKeys.apiKey: ApiConstant.apiKey,
            ApiKeys.categories: categoryId.value.toString(),
            ApiKeys.brands: null,
            ApiKeys.minPrice: '0',
            ApiKeys.maxPrice: '1000000000',
            ApiKeys.sortBy: 'id-asc',
            ApiKeys.page: page.value.toString()
          };
          fetchPage(page.value, map);
          debugPrint('false');
          pagingController.appendPage(list, page.value);
        }
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

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
    var response = await DioService().postMethod(url, map);
    try {
      if (response.data[ApiKeys.status] == 1) {
        response.data[ApiKeys.productResponse][ApiKeys.products]
            .forEach((product) {
          productList.add(ProductModel.fromJson(product));
        });
        maxPage.value =
            response.data[ApiKeys.productResponse][ApiKeys.numberOfPage];
      }
    } on DioException catch (e) {}
    loading(false);
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
    //fetchPage(page.value, map);
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
