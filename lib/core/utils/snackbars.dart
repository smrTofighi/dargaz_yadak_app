import 'package:get/get.dart';

class AppSnackBar {
  static showSnackBar(String title, String message) {
    Get.snackbar(title, message,);
  }
}
