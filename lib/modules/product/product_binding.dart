import 'package:car_soare_parts_app/modules/product/controller/product_single_controller.dart';
import 'package:get/get.dart';

class ProductBinding implements Bindings {
  @override
  void dependencies() {
    //Get.put(ProductListController());
    Get.lazyPut(() => ProductSingleController());
  }
}
