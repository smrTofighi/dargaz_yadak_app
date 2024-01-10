import 'package:car_soare_parts_app/core/styles/text_styles.dart';
import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/core/values/dimens.dart';
import 'package:car_soare_parts_app/core/values/icons.dart';
import 'package:car_soare_parts_app/modules/main/profile/orders/controllers/order_list_controller.dart';
import 'package:car_soare_parts_app/modules/main/profile/orders/controllers/order_single_controller.dart';
import 'package:car_soare_parts_app/modules/main/profile/orders/widgets/order_list_item.dart';
import 'package:car_soare_parts_app/modules/widgets/loading.dart';
import 'package:car_soare_parts_app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderListPage extends StatelessWidget {
  OrderListPage({Key? key}) : super(key: key);
  final OrderListController orderListController =
      Get.find<OrderListController>();
  final OrderSingleController orderSingleController =
      Get.find<OrderSingleController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          backgroundColor: LightColors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Text(
            'لیست سفارش ها',
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
        body: SizedBox(
          width: AppDimens.sizeOfDevice(context).width,
          child: Obx(
            () => orderListController.isLoading.value
                ? const Center(
                    child: LoadingWidget(color: LightColors.primary, size: 35),
                  )
                : orderListController.orderList.isEmpty
                    ? const Center(
                        child: Text('سفارشی وجود ندارد'),
                      )
                    : ListView.builder(
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            String orderId = orderListController
                                .orderList[index].id
                                .toString();
                            orderSingleController.getOrder(orderId);
                            orderSingleController.date(orderListController.orderList[index].createdAt);
                            Get.toNamed(NamePages.orderSinglePage);
                          },
                          child: OrderListItem(
                            orderCode: orderListController.orderList[index].id!,
                            status:
                                orderListController.orderList[index].status!,
                            createdAt:
                                orderListController.orderList[index].createdAt!,
                          ),
                        ),
                        itemCount: orderListController.orderList.length,
                        scrollDirection: Axis.vertical,
                      ),
          ),
        ),
      ),
    );
  }
}
