import 'package:car_soare_parts_app/core/utils/api_constant.dart';
import 'package:car_soare_parts_app/core/utils/api_keys.dart';
import 'package:car_soare_parts_app/core/utils/storage_key.dart';
import 'package:car_soare_parts_app/data/models/order_list_model.dart';
import 'package:car_soare_parts_app/data/services/dio_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OrderListController extends GetxController {
  RxList<OrderListModel> orderList = RxList();
  RxBool isLoading = false.obs;

  @override
  onInit() {
    super.onInit();
    getOrderList();
  }

  getOrderList() async {
    isLoading(true);
    var userId = GetStorage().read(StorageKeys.userId);
    String url = ApiConstant.getOrderListApi;
    Map<String, dynamic> map = {
      ApiKeys.apiKey: ApiConstant.apiKey,
      ApiKeys.userId: userId,
      ApiKeys.currentUser: userId
    };

    try {
      var response = await DioService().postMethod(url, map);

      if (response.data[ApiKeys.status] == 1) {
        response.data[ApiKeys.orders].forEach((order) {
          orderList.add(OrderListModel.fromJson(order));
          debugPrint(orderList[0].createdAt);
        });
      }
    } on Exception catch (e) {}
    isLoading(false);
  }
}
