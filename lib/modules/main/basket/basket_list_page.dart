import 'package:car_soare_parts_app/core/utils/dialogs.dart';
import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/core/values/dimens.dart';
import 'package:car_soare_parts_app/modules/main/basket/basket_controller.dart';
import 'package:car_soare_parts_app/modules/main/basket/widgets/basket_widget.dart';
import 'package:car_soare_parts_app/modules/main/basket/widgets/btm_nav_bar_basket.dart';
import 'package:car_soare_parts_app/modules/product/controller/product_single_controller.dart';
import 'package:car_soare_parts_app/modules/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasketListPage extends StatelessWidget {
  BasketListPage({Key? key}) : super(key: key);
  final BasketController basketController = Get.find<BasketController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: LightColors.scaffoldBG,
          body: SizedBox(
            width: AppDimens.sizeOfDevice(context).width,
            child: Obx(
              () => basketController.basketList.isNotEmpty
                  ? ListView.builder(
                      itemBuilder: (context, index) {
                        var title = basketController.basketList[index].title!;
                        var count = basketController.basketList[index].count!;
                        var price = basketController.basketList[index].price!;
                        return BasketWidget(
                          title: title,
                          count: count,
                          price: price,
                          onTap: () {
                            ProductSingleController controller =
                                Get.put(ProductSingleController());
                            controller.productId.value = int.parse(
                                basketController.basketList[index].productId!);
                            controller.getProduct();
                          },
                          onPressedDelete: () {
                            String id = basketController
                                .basketList[index].productId
                                .toString();
                            basketController.deleteBasketProduct(id, index);
                          },
                          increase: () {
                            String id =
                                basketController.basketList[index].productId!;
                            int newCount = int.parse(count) + 1;
                            basketController.updateBasketProduct(
                              index,
                              id,
                              newCount.toString(),
                              true,
                              context
                            );
                          },
                          decrease: () {
                            String id =
                                basketController.basketList[index].productId!;
                            int newCount = int.parse(count) - 1;
                            if (newCount == 0) {
                              basketController.deleteBasketProduct(id, index);
                            } else {
                              basketController.updateBasketProduct(
                                index,
                                id,
                                newCount.toString(),
                                true,
                                context
                              );
                            }
                          },
                        );
                      },
                      itemCount: basketController.basketList.length,
                      scrollDirection: Axis.vertical,
                    )
                  : const Center(
                      child: Text('هیچ محصولی در سبد خرید نیست'),
                    ),
            ),
          ),
          extendBody: true,
          bottomNavigationBar: BtmNavBarBasket()),
    );
  }
}
