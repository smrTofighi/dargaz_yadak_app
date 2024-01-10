import 'package:car_soare_parts_app/core/styles/box_decoration.dart';
import 'package:car_soare_parts_app/core/styles/text_styles.dart';
import 'package:car_soare_parts_app/core/utils/get_persian_number.dart';
import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/core/values/dimens.dart';
import 'package:car_soare_parts_app/core/values/icons.dart';
import 'package:car_soare_parts_app/gen/assets.gen.dart';
import 'package:car_soare_parts_app/modules/main/profile/orders/controllers/order_list_controller.dart';
import 'package:car_soare_parts_app/modules/main/profile/orders/controllers/order_single_controller.dart';
import 'package:car_soare_parts_app/modules/main/profile/orders/widgets/order_product_item.dart';
import 'package:car_soare_parts_app/modules/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:car_soare_parts_app/core/utils/extensions.dart';

class OrderSinglePage extends StatelessWidget {
  OrderSinglePage({Key? key}) : super(key: key);
  final OrderListController orderListController =
      Get.find<OrderListController>();
  final OrderSingleController orderSingleController =
      Get.find<OrderSingleController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: LightColors.scaffoldBG,
        appBar: AppBar(
          backgroundColor: LightColors.white,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Text(
            'جزئیات سفارش',
            style: LightTextStyles.normal16(LightColors.primary),
          ),
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
          centerTitle: true,
        ),
        body: Obx(
          () => orderSingleController.isLoading.value
              ? const Center(
                  child: LoadingWidget(color: LightColors.primary, size: 40),
                )
              : Padding(
                  padding: const EdgeInsets.all(AppDimens.medium),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'کد سفارش:',
                              style: LightTextStyles.normal14(
                                  LightColors.greyText),
                            ),
                            Text(
                              getPersianNumber(orderSingleController
                                  .orderModel.value.id
                                  .toString()),
                            ),
                          ],
                        ),
                        AppDimens.medium.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'تاریخ ثبت سفارش:',
                              style: LightTextStyles.normal14(
                                  LightColors.greyText),
                            ),
                            Text(
                              '${getPersianNumber(orderSingleController.date.substring(0, 4))}/${getPersianNumber(orderSingleController.date.substring(5, 7))}/${getPersianNumber(orderSingleController.date.substring(8, 10))}',
                            ),
                          ],
                        ),
                        AppDimens.medium.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'وضعیت سفارش:',
                              style: LightTextStyles.normal14(
                                  LightColors.greyText),
                            ),
                            Obx(
                              () => Text(
                                orderSingleController.status.value,
                                style: TextStyle(
                                    color: orderSingleController
                                        .statusColor.value),
                              ),
                            ),
                          ],
                        ),
                        AppDimens.medium.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'وضعیت پرداخت:',
                              style: LightTextStyles.normal14(
                                  LightColors.greyText),
                            ),
                            Obx(
                              () => Text(
                                orderSingleController.invoice.value,
                                style: TextStyle(
                                    color: orderSingleController
                                        .invoiceColor.value),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: AppDimens.medium * 2),
                          height: 2,
                          width: AppDimens.infinity,
                          decoration: AppBoxDecoration.divider,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'تحویل گیرنده:',
                              style: LightTextStyles.normal14(
                                  LightColors.greyText),
                            ),
                            Text(
                              orderSingleController
                                  .orderModel.value.deliveryName!,
                            ),
                          ],
                        ),
                        AppDimens.medium.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'شماره تماس:',
                              style: LightTextStyles.normal14(
                                  LightColors.greyText),
                            ),
                            Text(
                              getPersianNumber(orderSingleController
                                  .orderModel.value.deliveryMobile!),
                            ),
                          ],
                        ),
                        AppDimens.medium.height,
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'آدرس:',
                            style:
                                LightTextStyles.normal14(LightColors.greyText),
                          ),
                        ),
                        AppDimens.medium.height,
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            orderSingleController
                                .orderModel.value.deliveryAddress!,
                            style:
                                LightTextStyles.normal14(LightColors.blackText),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: AppDimens.medium * 2),
                          height: 2,
                          width: AppDimens.infinity,
                          decoration: AppBoxDecoration.divider,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'هزینه ارسال:',
                              style: LightTextStyles.normal14(
                                  LightColors.greyText),
                            ),
                            Text(
                              '${getPersianNumber(orderSingleController.sendCost.value)} تومان',
                            ),
                          ],
                        ),
                        AppDimens.medium.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'مبلغ کد نخفیف:',
                              style: LightTextStyles.normal14(
                                  LightColors.greyText),
                            ),
                            Text(
                              '${getPersianNumber(orderSingleController.discountCodeAmount.value)} تومان',
                            ),
                          ],
                        ),
                        AppDimens.medium.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'مبلغ کل:',
                              style: LightTextStyles.normal14(
                                  LightColors.greyText),
                            ),
                            Text(
                              '${getPersianNumber(orderSingleController.totalPrice.value)} تومان',
                            ),
                          ],
                        ),
                        AppDimens.medium.height,
                        TextButton.icon(
                          onPressed: () {
                            Get.defaultDialog();
                          },
                          icon: ImageIcon(
                            AppIcons.caretDown,
                            color: LightColors.primary,
                          ),
                          label: const Text(
                            'مشاهده فاکتور',
                            style: TextStyle(color: LightColors.primary),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: AppDimens.medium * 2),
                          height: 2,
                          width: AppDimens.infinity,
                          decoration: AppBoxDecoration.divider,
                        ),
                        SizedBox(
                          width: AppDimens.sizeOfDevice(context).width,
                          child: ListView.builder(
                            itemBuilder: (context, index) => OrderProductItem(
                              title: orderSingleController
                                  .orderProductList[index].productName!,
                              price: orderSingleController
                                  .orderProductList[index].productPrice!,
                              count: orderSingleController
                                  .orderProductList[index].productQuantity!,
                              discount: orderSingleController
                                  .orderProductList[index].productDiscount!,
                            ),
                            itemCount:
                                orderSingleController.orderProductList.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
