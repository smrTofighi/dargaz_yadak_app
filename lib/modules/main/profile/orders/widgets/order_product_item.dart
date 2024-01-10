import 'package:car_soare_parts_app/core/styles/text_styles.dart';
import 'package:car_soare_parts_app/core/utils/get_persian_number.dart';
import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/core/values/dimens.dart';
import 'package:car_soare_parts_app/core/values/icons.dart';
import 'package:flutter/material.dart';
import 'package:car_soare_parts_app/core/utils/extensions.dart';

class OrderProductItem extends StatelessWidget {
  const OrderProductItem(
      {Key? key,
      required this.title,
      this.discount = '0',
      required this.price,
      required this.count})
      : super(key: key);
  final String title;
  final String discount;
  final String price;
  final String count;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(AppDimens.medium),
        width: AppDimens.sizeOfDevice(context).width,
        height: 110,
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(30),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppDimens.radius),
                  ),
                  child: ImageIcon(AppIcons.cloudDisabled),
                ),
                Positioned(
                  bottom: 5,
                  left: 5,
                  child: Text(getPersianNumber(count)),
                )
              ],
            ),
            AppDimens.medium.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  title,
                  style: LightTextStyles.normal16(LightColors.blackText),
                ),
                Visibility(
                  visible: discount == '0' ? false : true,
                  child: Text(
                    '${getPersianNumber(discount)} تومان تخفیف',
                    style: LightTextStyles.normal12(
                      Colors.redAccent,
                    ),
                  ),
                ),
                Text(
                  '${getPersianNumber(price)} تومان',
                  style: LightTextStyles.normal14(
                    Colors.greenAccent.shade400,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
