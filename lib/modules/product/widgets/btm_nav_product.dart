import 'package:car_soare_parts_app/core/styles/box_decoration.dart';
import 'package:car_soare_parts_app/core/styles/text_styles.dart';
import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/core/values/dimens.dart';
import 'package:flutter/material.dart';
import 'package:car_soare_parts_app/core/utils/extensions.dart';

class BtmNavProduct extends StatelessWidget {
  const BtmNavProduct({Key? key, required this.price, required this.onPressed})
      : super(key: key);
  final String price;
  final Function() onPressed;
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
            child: ElevatedButton(
              onPressed: onPressed,
              child: const Text('افزودن به سبد خرید'),
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
