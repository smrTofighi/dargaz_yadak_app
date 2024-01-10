import 'package:car_soare_parts_app/core/styles/box_decoration.dart';
import 'package:car_soare_parts_app/core/styles/text_styles.dart';
import 'package:car_soare_parts_app/core/utils/get_persian_number.dart';
import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/core/values/dimens.dart';
import 'package:car_soare_parts_app/core/values/icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderListItem extends StatelessWidget {
  const OrderListItem(
      {Key? key,
      required this.orderCode,
      required this.status,
      required this.createdAt})
      : super(key: key);

  final int orderCode;
  final String status;
  final String createdAt;

  @override
  Widget build(BuildContext context) {
    Rx<Color> color = Colors.black.obs;
    String status2 = '';
    switch (status) {
      case '0':
        status2 = 'در حال پیگیری';
        color(Colors.blueAccent);
        break;
      case '1':
        status2 = 'تایید شده';
        color(Colors.greenAccent.shade400);
        break;

      case '2':
        status2 = 'در حال ارسال';
        color(LightColors.primary);

        break;
      case '3':
        status2 = 'دریافت شده';
        color(Colors.blue.shade700);
        break;
      case '4':
        status2 = 'لغو شده';
        color(Colors.redAccent);
        break;
    }
    return Container(
      padding: const EdgeInsets.all(AppDimens.small),
      margin: const EdgeInsets.all(AppDimens.small),
      width: AppDimens.infinity,
      height: 65,
      decoration: AppBoxDecoration.listTileWidget,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'کد سفارش : ',
                    style: LightTextStyles.normal14(Colors.grey),
                  ),
                  Text(
                    getPersianNumber(orderCode.toString()),
                    style: LightTextStyles.normal16(LightColors.blackText),
                  ),
                ],
              ),
              Text(
                '${getPersianNumber(createdAt.substring(0, 4))}/${getPersianNumber(createdAt.substring(5, 7))}/${getPersianNumber(createdAt.substring(8, 10))}',
                style: LightTextStyles.normal12(LightColors.greyText),
              ),
            ],
          ),
          Obx(
            () => Text(
              status2,
              style: LightTextStyles.bold14(color.value),
            ),
          ),
          ImageIcon(
            AppIcons.angleLeft,
            size: 16,
          )
        ],
      ),
    );
  }
}
