import 'package:car_soare_parts_app/core/styles/box_decoration.dart';
import 'package:car_soare_parts_app/core/styles/text_styles.dart';
import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/core/values/dimens.dart';
import 'package:car_soare_parts_app/core/values/icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:car_soare_parts_app/core/utils/extensions.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem(
      {Key? key,
      required this.title,
      required this.price,
      required this.rating,
      required this.image,
      required this.onTap,
      required this.onTapLike,
      required this.isLiked})
      : super(key: key);
  final String title;
  final String price;
  final String rating;
  final String image;
  final RxBool isLiked;
  final Function() onTap;
  final Function() onTapLike;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: AppBoxDecoration.productItemWidget,
        margin: const EdgeInsets.all(8.0),
        width: AppDimens.sizeOfDevice(context).width * 0.5,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(
                    AppDimens.high * 2.2,
                  ),
                  decoration: AppBoxDecoration.imageOfProductItemWidget,
                  width: AppDimens.infinity,
                  height: AppDimens.sizeOfDevice(context).height * 0.18,
                  child: ImageIcon(
                    AppIcons.cloudDisabled,
                    color: LightColors.primary,
                  ),
                ),
                Positioned(
                  top: 6,
                  left: 6,
                  child: GestureDetector(
                    onTap: onTapLike,
                    child: Obx(
                      () => isLiked.value
                          ? ImageIcon(
                              AppIcons.heartFill,
                              color: Colors.red,
                            )
                          : ImageIcon(
                              AppIcons.heart,
                              color: Colors.grey,
                            ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(6, 10, 6, 6),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: LightTextStyles.normal16(LightColors.blackText)
                      .copyWith(height: 1.5),
                ),
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  const Spacer(),
                  ImageIcon(
                    AppIcons.starFill,
                    color: Colors.yellow.shade900,
                    size: 14,
                  ),
                  (AppDimens.small / 2).width,
                  Text(
                    rating,
                    style: LightTextStyles.normal14(Colors.yellow.shade900),
                  ),
                  (AppDimens.small + 2).width,
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(6, 12, 6, 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${int.parse(price).separateWithComma} تومان ',
                  style: LightTextStyles.bold14(LightColors.blackText),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
