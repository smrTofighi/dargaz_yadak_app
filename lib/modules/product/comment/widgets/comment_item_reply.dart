import 'package:car_soare_parts_app/core/styles/text_styles.dart';
import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/core/values/dimens.dart';
import 'package:car_soare_parts_app/core/values/icons.dart';
import 'package:car_soare_parts_app/modules/product/controller/product_single_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentItemReply extends StatelessWidget {
  CommentItemReply({
    super.key,
    required this.index, required this.towIndex,
  });

  final ProductSingleController productSingleController =
      Get.find<ProductSingleController>();
  final int index;
  final int towIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimens.infinity,
      padding: const EdgeInsets.all(AppDimens.medium),
      margin: const EdgeInsets.fromLTRB(
        AppDimens.high,
        AppDimens.medium,
        AppDimens.high * 2,
        AppDimens.medium,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 5,
                spreadRadius: 1)
          ],
          borderRadius: BorderRadius.circular(AppDimens.radius)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                productSingleController
                    .commentList[index].replyItems![towIndex].fullName,
                style: LightTextStyles.bold16(LightColors.primary),
              ),
              Text(
                'یک روز پیش',
                style: LightTextStyles.normal14(LightColors.greyText),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(AppDimens.small),
            child: Text(productSingleController
                .commentList[index].replyItems![towIndex].comment),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: AppDimens.medium,
              ),
              IconButton(
                onPressed: () {},
                icon: ImageIcon(AppIcons.heart),
                color: Colors.red,
              ),
            ],
          )
        ],
      ),
    );
  }
}