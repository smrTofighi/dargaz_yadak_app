import 'package:car_soare_parts_app/core/styles/text_styles.dart';
import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/core/values/dimens.dart';
import 'package:car_soare_parts_app/core/values/icons.dart';
import 'package:car_soare_parts_app/modules/main/home/home_controller.dart';
import 'package:car_soare_parts_app/modules/product/controller/product_list_controller.dart';
import 'package:car_soare_parts_app/routes/pages.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:car_soare_parts_app/core/utils/extensions.dart';
import 'package:get_storage/get_storage.dart';

class FilterProductPage extends StatelessWidget {
  FilterProductPage({super.key});

  final ProductListController productListController =
      Get.find<ProductListController>();
  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'فیلتر محصولات',
            style: LightTextStyles.normal16(LightColors.primary),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: ImageIcon(
              AppIcons.angleRight,
              size: 20,
              color: LightColors.primary,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(AppDimens.small),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ExpandablePanel(
                  controller: ExpandableController(initialExpanded: true),
                  header: Text(
                    'دسته بندی محصولات',
                    style: LightTextStyles.bold16(LightColors.blackText),
                  ),
                  expanded: const SizedBox(),
                  collapsed: SizedBox(
                    width: AppDimens.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: homeController.productCategoryList.length,
                      itemBuilder: (context, index) => Obx(
                        () => Container(
                          margin: const EdgeInsets.all(AppDimens.small),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(homeController
                                  .productCategoryList[index].title!),
                              Checkbox(
                                value: productListController.categoryIdList
                                    .contains(homeController
                                        .productCategoryList[index].id
                                        .toString()),
                                activeColor: LightColors.primary,
                                onChanged: (value) {
                                  if (!productListController.categoryIdList
                                      .contains(homeController
                                          .productCategoryList[index].id
                                          .toString())) {
                                    productListController.categoryIdList.add(
                                        homeController
                                            .productCategoryList[index].id
                                            .toString());
                                  } else {
                                    productListController.categoryIdList.remove(
                                        homeController
                                            .productCategoryList[index].id
                                            .toString());
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                ExpandablePanel(
                  controller: ExpandableController(initialExpanded: true),
                  header: Text(
                    'برندها',
                    style: LightTextStyles.bold16(LightColors.blackText),
                  ),
                  expanded: const SizedBox(),
                  collapsed: SizedBox(
                    width: AppDimens.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: homeController.productBrandList.length,
                      itemBuilder: (context, index) => Obx(
                        () => Container(
                          margin: const EdgeInsets.all(AppDimens.small),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(homeController
                                  .productBrandList[index].title!),
                              Checkbox(
                                value: productListController.brandIdList
                                    .contains(homeController
                                        .productBrandList[index].id
                                        .toString()),
                                activeColor: LightColors.primary,
                                onChanged: (value) {
                                  if (!productListController.brandIdList
                                      .contains(homeController
                                          .productBrandList[index].id
                                          .toString())) {
                                    productListController.brandIdList.add(
                                        homeController
                                            .productBrandList[index].id
                                            .toString());
                                  } else {
                                    productListController.brandIdList.remove(
                                        homeController
                                            .productBrandList[index].id
                                            .toString());
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                ExpandablePanel(
                  controller: ExpandableController(initialExpanded: true),
                  collapsed: SizedBox(
                    child: Obx(
                      () => Column(
                        children: [
                          Text(productListController.minPrice.value
                              .floor()
                              .separateWithComma
                              .toString()),
                          Slider(
                            activeColor: LightColors.primary,
                            label: productListController.minPrice.value
                                .floor()
                                .separateWithComma
                                .toString(),
                            min: 0,
                            max: 10000000,
                            value: productListController.minPrice.value,
                            onChanged: (value) {
                              productListController.minPrice.value = value;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  expanded: SizedBox(),
                  header: Text(
                    'حداقل قیمت',
                    style: LightTextStyles.bold16(LightColors.blackText),
                  ),
                ),
                ExpandablePanel(
                  controller: ExpandableController(initialExpanded: true),
                  collapsed: SizedBox(
                    child: Obx(
                      () => Column(
                        children: [
                          Text(productListController.maxPrice.value
                              .floor()
                              .separateWithComma
                              .toString()),
                          Slider(
                            activeColor: LightColors.primary,
                            label: productListController.maxPrice.value
                                .floor()
                                .separateWithComma
                                .toString(),
                            min: 0,
                            max: 50000000,
                            value: productListController.maxPrice.value,
                            onChanged: (value) {
                              productListController.maxPrice.value = value;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  expanded: SizedBox(),
                  header: Text(
                    'حداکثر قیمت',
                    style: LightTextStyles.bold16(LightColors.blackText),
                  ),
                ),
                AppDimens.high.height,
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppDimens.medium),
                  width: AppDimens.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      productListController.getProductList();
                      Get.offNamed(NamePages.productListPage);
                    },
                    child: const Text(
                      'اعمال تغییرات',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
