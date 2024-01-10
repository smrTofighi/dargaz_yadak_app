import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/modules/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDialogs {
  static loadingDialog() {
    Get.dialog(
      Center(
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white
          ),
          child: const LoadingWidget(
            color: LightColors.primary,
            size: 40,
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }
}
