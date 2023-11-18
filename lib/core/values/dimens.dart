import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AppDimens {
  static const double small = 8.0;
  static const double medium = 12.0;
  static const double high = 16.0;
  static Size sizeOfDevice(BuildContext context) {
    return MediaQuery.sizeOf(context);
  }

  static double width = Get.width;
  static double height = Get.height;

  static double infinity = double.infinity;
  static double radius = 8;
}
