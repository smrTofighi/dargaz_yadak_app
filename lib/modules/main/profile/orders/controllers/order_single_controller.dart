import 'package:car_soare_parts_app/core/utils/api_constant.dart';
import 'package:car_soare_parts_app/core/utils/api_keys.dart';
import 'package:car_soare_parts_app/core/utils/storage_key.dart';
import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/data/models/order_model.dart';
import 'package:car_soare_parts_app/data/models/order_product_model.dart';
import 'package:car_soare_parts_app/data/services/dio_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OrderSingleController extends GetxController {
  Rx<OrderModel> orderModel = OrderModel().obs;
  RxList<OrderProductModel> orderProductList = RxList();
  RxString totalPrice = RxString('');
  RxString sendCost = RxString('');
  RxString invoiceStatus = RxString('');
  RxInt invoiceId = RxInt(0);
  RxString discountCodeAmount = RxString('');
  RxBool isLoading = RxBool(false);
  RxString date = RxString('');
  RxString status = RxString('');
  RxString invoice = RxString('');
  Rx<Color> statusColor = Rx(Colors.black);
  Rx<Color> invoiceColor = Rx(Colors.black);

  getOrder(String orderId) async {
    isLoading(true);
    var currentUser = GetStorage().read(StorageKeys.userId);
    String url = ApiConstant.getOrderApi;
    Map<String, dynamic> map = {
      ApiKeys.apiKey: ApiConstant.apiKey,
      ApiKeys.orderId: orderId,
      ApiKeys.currentUser: currentUser,
    };

    var response = await DioService().postMethod(url, map);

    if (response.data[ApiKeys.status] == 1) {
      var data = response.data;
      orderModel.value = OrderModel.fromJson(data[ApiKeys.order]);
      data[ApiKeys.orderProducts].forEach((orderProduct) {
        orderProductList.add(OrderProductModel.fromJson(orderProduct));
      });
      totalPrice(data[ApiKeys.totalPrice]);
      sendCost(data[ApiKeys.sendCost]);
      invoiceStatus(data[ApiKeys.invoiceStatus]);
      invoiceId(data[ApiKeys.invoiceId]);
      discountCodeAmount(data[ApiKeys.discountCodeAmount]);


       
    switch (invoiceStatus.value) {
      case '0':
        invoice('پرداخت نشده');
        invoiceColor(Colors.redAccent);
        break;
      case '1':
        invoice('پرداخت شده');
        invoiceColor(Colors.greenAccent.shade400);
    }
  

  
    switch (orderModel.value.status) {
      case '0':
        status.value = 'در حال پیگیری';
        statusColor(Colors.blueAccent);
        break;
      case '1':
        status.value = 'تایید شده';
        statusColor(Colors.greenAccent.shade400);
        break;

      case '2':
        status.value = 'در حال ارسال';
        statusColor(LightColors.primary);

        break;
      case '3':
        status.value = 'دریافت شده';
        statusColor(Colors.blue.shade700);
        break;
      case '4':
        status.value = 'لغو شده';
        statusColor(Colors.redAccent);
        break;
    }
  
    }
    debugPrint(invoiceStatus.value);
    isLoading(false);
  }
}

// "total_price": "10000",
//     "send_cost": "0",
//     "discount_code_amount": "0",
//     "invoice_id": 1,
//     "invoice_status": "1"
