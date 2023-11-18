import 'dart:developer';
import 'package:car_soare_parts_app/core/styles/text_styles.dart';
import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/core/values/dimens.dart';
import 'package:car_soare_parts_app/core/values/icons.dart';
import 'package:car_soare_parts_app/modules/main/widgets/search_box.dart';
import 'package:car_soare_parts_app/modules/product/controller/product_list_controller.dart';
import 'package:car_soare_parts_app/modules/product/controller/product_single_controller.dart';
import 'package:car_soare_parts_app/modules/product/widgets/product_list_item.dart';
import 'package:car_soare_parts_app/modules/widgets/loading.dart';
import 'package:car_soare_parts_app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListPage extends StatelessWidget {
  ProductListPage({Key? key}) : super(key: key);
  final ScrollController _scrollController = ScrollController();
  final ProductListController productListController =
      Get.find<ProductListController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.delete<ProductListController>();
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: Text(
              'محصولات ${productListController.titleAppBar.value}',
              style: LightTextStyles.normal16(LightColors.primary),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Get.toNamed(NamePages.filterProductPage);
                },
                icon: ImageIcon(
                  AppIcons.filter,
                  color: LightColors.primary,
                  size: 20,
                ),
              ),
            ],
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(40),
              child: SearchBox(),
            ),
            leading: IconButton(
              onPressed: () {
                Get.delete<ProductListController>();
                Get.back();
              },
              icon: ImageIcon(
                AppIcons.angleRight,
                color: LightColors.primary,
                size: 20,
              ),
            ),
            centerTitle: true,
          ),
          body: Obx(
            () => productListController.loading.value
                ? const Center(
                    child: LoadingWidget(
                      color: LightColors.primary,
                      size: 45,
                    ),
                  )
                : SizedBox(
                    width: AppDimens.sizeOfDevice(context).width,
                    child: NotificationListener<ScrollEndNotification>(
                      child: Obx(
                        () => productListController.productList.isEmpty
                            ? Center(
                                child: Text(
                                  'محصولی وجود ندارد',
                                  style: LightTextStyles.bold16(
                                      LightColors.blackText),
                                ),
                              )
                            : GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisExtent: 300,
                                ),
                                itemCount:
                                    productListController.productList.length,
                                controller: _scrollController,
                                itemBuilder: (context, index) {
                                  var title = productListController
                                      .productList[index].title!;
                                  var price = productListController
                                      .productList[index].price!;
                                  RxBool isLiked = true.obs;

                                  //? that widget was return
                                  return ProductListItem(
                                      title: title,
                                      price: price,
                                      rating: '4.8',
                                      image: '',
                                      onTap: () {
                                        ProductSingleController controller =
                                            Get.put(ProductSingleController());
                                        controller.productId.value =
                                            productListController
                                                .productList[index].id!;

                                        controller.getProduct();
                                      },
                                      onTapLike: () {},
                                      isLiked: isLiked);
                                }),
                      ),
                      onNotification: (scrollEnd) {
                        final metrics = scrollEnd.metrics;
                        if (metrics.atEdge) {
                          bool isTop = metrics.pixels == 0;
                          if (isTop) {
                            log('At the top');
                          } else {
                            //productListController.page.value = 2;
                            //productListController.getProuctCategory();
                          }
                        }
                        return true;
                      },
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
