import 'package:car_soare_parts_app/core/styles/text_styles.dart';
import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/core/values/dimens.dart';
import 'package:car_soare_parts_app/core/values/icons.dart';
import 'package:car_soare_parts_app/modules/product/controller/product_list_controller.dart';
import 'package:car_soare_parts_app/modules/product/controller/product_single_controller.dart';
import 'package:car_soare_parts_app/modules/product/widgets/product_list_item.dart';
import 'package:car_soare_parts_app/modules/widgets/loading.dart';
import 'package:car_soare_parts_app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  late ScrollController _scrollController;
  final ProductListController productListController =
      Get.find<ProductListController>();
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        productListController.loadMore();
      });
  }

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
            backgroundColor: Colors.white,
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
            // bottom: const PreferredSize(
            //   preferredSize: Size.fromHeight(40),
            //   child: SearchBox(),
            // ),
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
                // : SizedBox(
                //     width: AppDimens.sizeOfDevice(context).width,
                //     child: PagedGridView<int, ProductModel>(
                //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //              crossAxisCount: 2,
                //               mainAxisExtent: 310,
                //              ),
                //       pagingController:
                //           productListController.pagingController,
                //       builderDelegate: PagedChildBuilderDelegate<ProductModel>(
                //         itemBuilder: (context, item, index){
                //           RxBool isLiked = true.obs;
                //           return ProductListItem(
                //                   title: item.title!,
                //                   price:  item.price!,
                //                   rating: '4.8',
                //                   image: '',
                //                   onTap: () {
                //                     ProductSingleController controller =
                //                         Get.put(ProductSingleController());
                //                     controller.productId.value =
                //                         productListController
                //                             .productList[index].id!;

                //                     controller.getProduct();
                //                   },
                //                   onTapLike: () {},
                //                   isLiked: isLiked);
                //             },
                //       ),
                //     ),
                //   )

                : SizedBox(
                    width: AppDimens.sizeOfDevice(context).width,
                    child: Obx(
                      () => productListController.productList.isEmpty
                          ? Center(
                              child: Text(
                                'محصولی وجود ندارد',
                                style: LightTextStyles.bold16(
                                    LightColors.blackText),
                              ),
                            )
                          : Column(
                              children: [
                                Expanded(
                                  child: GridView.builder(
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisExtent: 320,
                                      ),
                                      itemCount: productListController
                                          .productList.length,
                                      controller: _scrollController,
                                      itemBuilder: (context, index) {
                                        var title = productListController
                                            .productList[index].title!;
                                        var price = productListController
                                            .productList[index].price!;
                                        RxBool isLiked = true.obs;
                                        var image = productListController.productList[index].image!;
                                        //? that widget was return
                                        return ProductListItem(
                                            title: title,
                                            price: price,
                                            rating: '4.8',
                                            image: image,
                                            onTap: () {
                                              ProductSingleController
                                                  controller = Get.put(
                                                      ProductSingleController());
                                              controller.productId.value =
                                                  productListController
                                                      .productList[index].id!;

                                              controller.getProduct();
                                              controller.getProductComments();
                                            },
                                            onTapLike: () {},
                                            isLiked: isLiked);
                                      }),
                                ),
                                if (productListController.loading2.value)
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(top: 10, bottom: 40),
                                    child: Center(
                                      child: LoadingWidget(
                                          color: LightColors.primary, size: 30),
                                    ),
                                  ),
                              ],
                            ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
