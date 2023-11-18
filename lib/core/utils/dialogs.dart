import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/modules/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDialogs {
  static loadingDialog() {
    Get.dialog(
      const Center(
        child: LoadingWidget(
          color: LightColors.primary,
          size: 40,
        ),
      ),
      barrierDismissible: false,
    );
  }
}
