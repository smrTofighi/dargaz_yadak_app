import 'package:car_soare_parts_app/modules/search/search_controller.dart';
import 'package:get/get.dart';

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SearchProductController());
  }
}
