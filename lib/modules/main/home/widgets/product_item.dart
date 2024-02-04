import 'package:car_soare_parts_app/core/styles/text_styles.dart';
import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/core/values/dimens.dart';
import 'package:car_soare_parts_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:car_soare_parts_app/core/utils/extensions.dart';

class ProductItem extends StatelessWidget {
  ProductItem({
    Key? key,
    required this.title,
    required this.price,
    this.oldPrice = 0,
    this.discount = 0,
    this.time = 0,
    required this.onTap, required this.index,
  }) : super(key: key);
  final String title;
  final int index;
  final int price;
  final int oldPrice;
  final int discount;
  final int time;
  final Function() onTap;
  final List images = [
    Assets.images.fp1.path,
    Assets.images.fp2.path,
    Assets.images.fp3.path,
    Assets.images.fp4.path,
    Assets.images.fp4.path,
    Assets.images.fp4.path,
    Assets.images.fp4.path,
    Assets.images.fp4.path,
    Assets.images.fp4.path,
    Assets.images.fp4.path,
    Assets.images.fp4.path,
    Assets.images.fp4.path,
  ];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppDimens.small),
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimens.radius),
          gradient: const LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: GradientColors.greyToWhite,
          ),
        ),
        width: 200,
        child: Column(
          children: [
            Container(
              width: 180,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.asset(images[index]).image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            AppDimens.medium.height,
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: LightTextStyles.normal16(
                  LightColors.blackText,
                ),
              ),
            ),
            AppDimens.medium.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${price.separateWithComma} تومان',
                      style: LightTextStyles.normal14(LightColors.black),
                    ),
                    Visibility(
                      visible: discount > 0 ? true : false,
                      child: Text(
                        oldPrice.separateWithComma,
                        style: LightTextStyles.normal12(LightColors.greyText)
                            .copyWith(decoration: TextDecoration.lineThrough),
                      ),
                    ),
                  ],
                ),
                Visibility(
                  visible: discount > 0 ? true : false,
                  child: Container(
                    padding: const EdgeInsets.all(AppDimens.small / 2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: LightColors.primary),
                    child: Text(
                      '$discount %',
                      style: LightTextStyles.normal12(LightColors.whiteText),
                    ),
                  ),
                )
              ],
            ),
            AppDimens.high.height,
            Visibility(
              visible: time > 0 ? true : false,
              child: Container(
                height: 2,
                width: double.infinity,
                color: Colors.blue,
              ),
            ),
            AppDimens.medium.height,
            Visibility(
              visible: time > 0 ? true : false,
              child: Text(
                time.toString(),
                style: LightTextStyles.normal14(Colors.blue),
              ),
            )
          ],
        ),
      ),
    );
  }
}
