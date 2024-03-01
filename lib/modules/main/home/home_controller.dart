import 'dart:developer';
import 'package:car_soare_parts_app/core/utils/api_constant.dart';
import 'package:car_soare_parts_app/core/utils/api_keys.dart';
import 'package:car_soare_parts_app/data/models/home_widget_detail_model.dart';
import 'package:car_soare_parts_app/data/models/home_widget_model.dart';
import 'package:car_soare_parts_app/data/models/product_brand_model.dart';
import 'package:car_soare_parts_app/data/models/category_model.dart';
import 'package:car_soare_parts_app/data/models/product_model.dart';
import 'package:car_soare_parts_app/data/services/dio_service.dart';
import 'package:car_soare_parts_app/gen/assets.gen.dart';
import 'package:car_soare_parts_app/modules/main/home/widgets/slide_widget.dart';
import 'package:car_soare_parts_app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<ProductModel> productList = RxList();
  RxList<HomeWidetModel> homeWidgetList = RxList();
  RxList<CategoryModel> productCategoryList = RxList();
  RxList<BrandModel> productBrandList = RxList();
  RxList<Widget> widgetList = RxList();
  RxBool loading = false.obs;
  RxList<HomeWidgetDetailModel> homeWidgetDetailList = RxList();
  RxString titleAppBar = ''.obs;

  @override
  void onInit() {
    loading.value = true;
    super.onInit();
    getProductList();
    getHomeWidget();
    getProductCategories();
    getProductBrand();
    Future.delayed(const Duration(seconds: 1))
        .then((value) => loading.value = false);
  }

  getHomeWidgetList(int id) async {
    loading.value = true;
    String url = ApiConstant.getHomeWidgetDetailApi;
    Map<String, dynamic> map = {
      ApiKeys.apiKey: ApiConstant.apiKey,
      ApiKeys.widgetId: id.toString(),
      ApiKeys.contentType: '3'
    };
    var response = await DioService().postMethod(url, map);
    if (response.data[ApiKeys.status] == 1) {
      response.data[ApiKeys.widgetDetail].forEach((widget) {
        homeWidgetDetailList.add(HomeWidgetDetailModel.fromJson(widget));
      });
    }
    Get.toNamed(NamePages.homeWidgetListPage);
    loading.value = false;
  }

  getProductList() async {
    String url = ApiConstant.getProductListApi;
    Map<String, dynamic> map = {
      ApiKeys.apiKey: ApiConstant.apiKey,
      ApiKeys.categories: '',
      ApiKeys.brands: '',
      ApiKeys.minPrice: '0',
      ApiKeys.maxPrice: '1000000000',
      ApiKeys.sortBy: 'id-asc',
      ApiKeys.page: '1'
    };
    var response = await DioService().postMethod(url, map);
    switch (response.data[ApiKeys.status]) {
      case 1:
        response.data[ApiKeys.productResponse][ApiKeys.products]
            .forEach((product) {
          productList.add(ProductModel.fromJson(product));
        });
        log(productList[0].title.toString());
        break;
    }
  }

  getProductBrand() async {
    String url = ApiConstant.getProductBrandApi;
    Map<String, dynamic> map = {
      ApiKeys.apiKey: ApiConstant.apiKey,
      ApiKeys.parentId: '0'
    };

    var response = await DioService().postMethod(url, map);
    if (response.data[ApiKeys.status] == 1) {
      response.data[ApiKeys.brands].forEach((brand) {
        productBrandList.add(BrandModel.fromJson(brand));
      });
      log(productBrandList[0].image!.path!.toString());
    }
  }

  getProductCategories() async {
    Map<String, dynamic> map = {
      ApiKeys.apiKey: ApiConstant.apiKey,
      'parent_id': '0'
    };
    String url = ApiConstant.getProductCategoriesApi;
    var response = await DioService().postMethod(url, map);
    switch (response.data[ApiKeys.status]) {
      case 1:
        response.data["categories"].forEach((category) {
          productCategoryList.add(CategoryModel.fromJson(category));
        });

        break;
    }
  }

  getHomeWidget() async {
    List images = [
      Assets.images.slide1.path,
      Assets.images.slide2.path,
      Assets.images.slide3.path,
      Assets.images.slide3.path,
    ];
    Map<String, dynamic> map = {
      ApiKeys.apiKey: ApiConstant.apiKey,
      'widget_type': '3',
    };
    String url = ApiConstant.getHomeWidgetApi;

    var response = await DioService().postMethod(url, map);

    switch (response.data[ApiKeys.status]) {
      case 1:
        int index = 0;
        response.data['widget_list'].forEach((widget) {
          homeWidgetList.add(HomeWidetModel.fromJson(widget));
        });
        for (var element in homeWidgetList) {
          widgetList.add(SlideWidget(
            title: element.title!,
            image: images[index],
          ));
          index++;
        }
        break;
      case -1:
        break;
    }
  }
}
