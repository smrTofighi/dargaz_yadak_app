import 'package:car_soare_parts_app/core/styles/box_decoration.dart';
import 'package:car_soare_parts_app/core/styles/text_styles.dart';
import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/core/values/dimens.dart';
import 'package:car_soare_parts_app/modules/product/controller/product_single_controller.dart';
import 'package:flutter/material.dart';
import 'package:car_soare_parts_app/core/utils/extensions.dart';
import 'package:get/get.dart';

class BtmNavProduct extends StatelessWidget {
  BtmNavProduct({Key? key, required this.price, required this.onPressed})
      : super(key: key);
  final String price;
  final Function() onPressed;
  final ProductSingleController controller =
      Get.find<ProductSingleController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.medium),
      width: AppDimens.sizeOfDevice(context).width,
      height: 100,
      decoration: AppBoxDecoration.bottomNavigation,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: AppDimens.sizeOfDevice(context).width / 2.2,
            height: 45,
            child: int.parse(controller.productModel.value.quantity!) == 0
                ? Center(
                    child: const Text(
                      'عدم موجودی کافی',
                      style: const TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                : ElevatedButton(
                    onPressed: onPressed,
                    child: const Text(
                      'افزودن به سبد خرید',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
          ),
          Text(
            '${int.parse(price).separateWithComma} تومان',
            style: LightTextStyles.normal16(LightColors.blackText),
          )
        ],
      ),
    );
  }
}
