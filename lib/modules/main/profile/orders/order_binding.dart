import 'package:car_soare_parts_app/modules/main/profile/orders/controllers/order_list_controller.dart';
import 'package:car_soare_parts_app/modules/main/profile/orders/controllers/order_single_controller.dart';
import 'package:get/get.dart';

class OrderBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(OrderListController());
    Get.lazyPut(() => OrderSingleController());
  }
}
