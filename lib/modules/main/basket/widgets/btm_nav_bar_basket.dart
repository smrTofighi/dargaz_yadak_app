import 'package:car_soare_parts_app/core/styles/box_decoration.dart';
import 'package:car_soare_parts_app/core/styles/text_styles.dart';
import 'package:car_soare_parts_app/core/utils/get_persian_number.dart';
import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/core/values/dimens.dart';
import 'package:car_soare_parts_app/modules/main/basket/basket_controller.dart';
import 'package:car_soare_parts_app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BtmNavBarBasket extends StatelessWidget {
  BtmNavBarBasket({Key? key}) : super(key: key);
  final BasketController controller = Get.find<BasketController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.medium),
      width: AppDimens.sizeOfDevice(context).width,
      height: 100,
      decoration: AppBoxDecoration.bottomNavigation,
      child: Row(
        children: [
          Obx(() => SizedBox(
                width: AppDimens.sizeOfDevice(context).width / 2.2,
                height: 45,
                child: ElevatedButton(
                  onPressed: controller.basketList.isEmpty
                      ? null
                      : () {
                          if (controller.basketList.isNotEmpty) {
                            Get.toNamed(NamePages.startPaymentPage);
                          }
                        },
                  child: const Text(
                    'ادامه فرایند خرید',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )),
          const Spacer(),
          Obx(
            () => Text(
              '${getPersianNumber(controller.totalPrice.value.toString())} تومان',
              style: LightTextStyles.normal16(LightColors.blackText),
            ),
          ),
        ],
      ),
    );
  }
}
