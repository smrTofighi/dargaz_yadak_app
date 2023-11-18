import 'package:car_soare_parts_app/core/styles/text_styles.dart';
import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/core/values/dimens.dart';
import 'package:car_soare_parts_app/core/values/icons.dart';
import 'package:car_soare_parts_app/core/values/strings.dart';
import 'package:car_soare_parts_app/modules/main/home/home_controller.dart';
import 'package:car_soare_parts_app/modules/main/home/widgets/category_widget.dart';
import 'package:car_soare_parts_app/modules/main/home/widgets/home_silder.dart';
import 'package:car_soare_parts_app/modules/main/home/widgets/product_item.dart';
import 'package:car_soare_parts_app/modules/main/home/widgets/vertical_text.dart';
import 'package:car_soare_parts_app/modules/product/controller/product_list_controller.dart';
import 'package:car_soare_parts_app/modules/product/controller/product_single_controller.dart';
import 'package:car_soare_parts_app/modules/widgets/loading.dart';
import 'package:car_soare_parts_app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:car_soare_parts_app/core/utils/extensions.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => homeController.loading.value
          ? const Center(
              child: LoadingWidget(
                color: LightColors.primary,
                size: 60,
              ),
            )
          : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeSlider(),
                  AppDimens.medium.height,
                  Obx(
                    () => homeController.productCategoryList.isEmpty
                        ? const Center(
                            child: LoadingWidget(
                                color: LightColors.primary, size: 30),
                          )
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CategoryWidget(
                                    title: homeController
                                        .productCategoryList[0].title!,
                                    onTap: () {
                                      ProductListController controller =
                                          Get.put(ProductListController());
                                      controller.titleAppBar(
                                          "دسته بندی ${homeController.productCategoryList[0].title!}");
                                      Get.toNamed(NamePages.productListPage);
                                      int id = homeController
                                          .productCategoryList[0].id!;
                                      controller.categoryId.value = id;
                                      controller.isBrand.value = false;

                                      Get.find<ProductListController>()
                                          .getProductCategory();
                                    },
                                    colors: [
                                      LightColors.primary,
                                     LightColors.primary.withOpacity(0.5),
                                    ],
                                    icon: AppIcons.carEngine,
                                  ),
                                  CategoryWidget(
                                    title: homeController
                                        .productCategoryList[1].title!,
                                    onTap: () {
                                      ProductListController controller =
                                          Get.put(ProductListController());
                                      controller.titleAppBar(
                                          "دسته بندی ${homeController.productCategoryList[1].title!}");
                                      Get.toNamed(NamePages.productListPage);
                                      int id = homeController
                                          .productCategoryList[1].id!;
                                      controller.categoryId.value = id;
                                      controller.isBrand.value = false;

                                      Get.find<ProductListController>()
                                          .getProductCategory();
                                    },
                                    colors: [
                                      Colors.deepPurple,
                                      Colors.deepPurple.withOpacity(0.5),
                                    ],
                                    icon: AppIcons.carSpring,
                                  ),
                                  CategoryWidget(
                                    title: homeController
                                        .productCategoryList[2].title!,
                                    onTap: () {
                                      ProductListController controller =
                                          Get.put(ProductListController());
                                      controller.titleAppBar(
                                          "دسته بندی ${homeController.productCategoryList[2].title!}");
                                      Get.toNamed(NamePages.productListPage);
                                      int id = homeController
                                          .productCategoryList[2].id!;
                                      controller.categoryId.value = id;
                                      controller.isBrand.value = false;

                                      Get.find<ProductListController>()
                                          .getProductCategory();
                                    },
                                    colors: [
                                      Colors.deepPurple,
                                      Colors.deepPurple.withOpacity(0.5),
                                    ],
                                    icon: AppIcons.gearbox,
                                  ),
                                  CategoryWidget(
                                    title: homeController
                                        .productCategoryList[3].title!,
                                    onTap: () {
                                      ProductListController controller =
                                          Get.put(ProductListController());
                                      controller.titleAppBar(
                                          "دسته بندی ${homeController.productCategoryList[3].title!}");
                                      Get.toNamed(NamePages.productListPage);
                                      int id = homeController
                                          .productCategoryList[3].id!;
                                      controller.categoryId.value = id;
                                      controller.isBrand.value = false;

                                      Get.find<ProductListController>()
                                          .getProductCategory();
                                    },
                                    colors: [
                                      Colors.deepPurple,
                                      Colors.deepPurple.withOpacity(0.5),
                                    ],
                                    icon: AppIcons.chassis,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CategoryWidget(
                                    title: homeController
                                        .productCategoryList[4].title!,
                                    onTap: () {
                                      ProductListController controller =
                                          Get.put(ProductListController());
                                      controller.titleAppBar(
                                          "دسته بندی ${homeController.productCategoryList[4].title!}");
                                      Get.toNamed(NamePages.productListPage);
                                      int id = homeController
                                          .productCategoryList[4].id!;
                                      controller.categoryId.value = id;
                                      controller.isBrand.value = false;

                                      Get.find<ProductListController>()
                                          .getProductCategory();
                                    },
                                    colors: [
                                      Colors.deepPurple,
                                      Colors.deepPurple.withOpacity(0.5),
                                    ],
                                    icon: AppIcons.accumulator,
                                  ),
                                  CategoryWidget(
                                    title: homeController
                                        .productCategoryList[5].title!,
                                    onTap: () {
                                      ProductListController controller =
                                          Get.put(ProductListController());
                                      controller.titleAppBar(
                                          "دسته بندی ${homeController.productCategoryList[5].title!}");
                                      Get.toNamed(NamePages.productListPage);
                                      int id = homeController
                                          .productCategoryList[5].id!;
                                      controller.categoryId.value = id;
                                      controller.isBrand.value = false;

                                      Get.find<ProductListController>()
                                          .getProductCategory();
                                    },
                                    colors: [
                                      Colors.deepPurple,
                                      Colors.deepPurple.withOpacity(0.5),
                                    ],
                                    icon: AppIcons.ballBearing,
                                  ),
                                  CategoryWidget(
                                    title: homeController
                                        .productCategoryList[6].title!,
                                    onTap: () {
                                      ProductListController controller =
                                          Get.put(ProductListController());
                                      controller.titleAppBar(
                                          "دسته بندی ${homeController.productCategoryList[6].title!}");
                                      Get.toNamed(NamePages.productListPage);
                                      int id = homeController
                                          .productCategoryList[6].id!;
                                      controller.categoryId.value = id;
                                      controller.isBrand.value = false;

                                      Get.find<ProductListController>()
                                          .getProductCategory();
                                    },
                                    colors: [
                                      Colors.deepPurple,
                                      Colors.deepPurple.withOpacity(0.5),
                                    ],
                                    icon: AppIcons.timingBelt,
                                  ),
                                  CategoryWidget(
                                    title: homeController
                                        .productCategoryList[7].title!,
                                    onTap: () {
                                      ProductListController controller =
                                          Get.put(ProductListController());
                                      controller.titleAppBar(
                                          "دسته بندی ${homeController.productCategoryList[7].title!}");
                                      Get.toNamed(NamePages.productListPage);
                                      int id = homeController
                                          .productCategoryList[7].id!;
                                      controller.categoryId.value = id;
                                      controller.isBrand.value = false;

                                      Get.find<ProductListController>()
                                          .getProductCategory();
                                    },
                                    colors: [
                                      Colors.deepPurple,
                                      Colors.deepPurple.withOpacity(0.5),
                                    ],
                                    icon: AppIcons.application,
                                  ),
                                ],
                              ),
                            ],
                          ),
                  ),
                  AppDimens.medium.height,
                  SizedBox(
                    height: 330,
                    child: Obx(
                      () => ListView.builder(
                        itemBuilder: (context, index) {
                          var list = homeController.productList;
                          return index == 0
                              ? VerticalText(
                                  title: AppStrings.amazing,
                                  onTap: () {},
                                )
                              : ProductItem(
                                  title: list[index - 1].title!,
                                  price: int.parse(list[index - 1].price!),
                                  discount: 20,
                                  oldPrice: int.parse(list[index - 1].price!),
                                  time: 2000,
                                  onTap: () {
                                    ProductSingleController
                                        productSingleController =
                                        Get.put(ProductSingleController());
                                    productSingleController.productId.value =
                                        list[index - 1].id!;
                                    productSingleController.getProduct();
                                  },
                                );
                        },
                        itemCount: homeController.productList.length + 1,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ),
                  AppDimens.medium.height,
                  SizedBox(
                    height: 285,
                    child: Obx(
                      () => ListView.builder(
                        itemBuilder: (context, index) {
                          var list = homeController.productList;
                          return index == 0
                              ? VerticalText(
                                  title: 'پر فروش ترین ها',
                                  onTap: () {},
                                )
                              : ProductItem(
                                  title: list[index - 1].title!,
                                  price: int.parse(list[index - 1].price!),
                                  onTap: () {
                                    ProductSingleController
                                        productSingleController =
                                        Get.put(ProductSingleController());
                                    productSingleController.productId.value =
                                        list[index - 1].id!;
                                    productSingleController.getProduct();
                                  },
                                );
                        },
                        itemCount: homeController.productList.length + 1,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ),
                  AppDimens.high.height,
                  SizedBox(
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            ImageIcon(
                              AppIcons.timeTwentyFour,
                              color: LightColors.primary,
                            ),
                            AppDimens.small.height,
                            Text(
                              'پشتیبانی آنلاین',
                              style:
                                  LightTextStyles.normal16(LightColors.primary),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            ImageIcon(
                              AppIcons.truckSide,
                              color: LightColors.primary,
                            ),
                            AppDimens.small.height,
                            Text(
                              'ارسال رایگان',
                              style:
                                  LightTextStyles.normal16(LightColors.primary),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            ImageIcon(
                              AppIcons.dollar,
                              color: LightColors.primary,
                            ),
                            AppDimens.small.height,
                            Text(
                              'بازگشت وجه',
                              style:
                                  LightTextStyles.normal16(LightColors.primary),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            ImageIcon(
                              AppIcons.shieldCheck,
                              color: LightColors.primary,
                            ),
                            AppDimens.small.height,
                            Text(
                              'پرداخت امن',
                              style:
                                  LightTextStyles.normal16(LightColors.primary),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  (AppDimens.high * 5).height
                ],
              ),
            ),
    );
  }
}
