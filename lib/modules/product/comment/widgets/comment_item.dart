import 'package:car_soare_parts_app/core/styles/text_styles.dart';
import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/core/values/dimens.dart';
import 'package:car_soare_parts_app/core/values/icons.dart';
import 'package:car_soare_parts_app/modules/product/comment/widgets/comment_reply_list.dart';
import 'package:car_soare_parts_app/modules/product/controller/product_single_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentItem extends StatelessWidget {
  CommentItem({
    super.key,
    required this.index,
  });
  final int index;

  final ProductSingleController productSingleController =
      Get.find<ProductSingleController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Container(
            width: AppDimens.infinity,
            padding: const EdgeInsets.all(AppDimens.medium),
            margin: const EdgeInsets.symmetric(
                vertical: AppDimens.medium, horizontal: AppDimens.high),
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
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      productSingleController.commentList[index].fullName,
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
                  child:
                      Text(productSingleController.commentList[index].comment),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 120,
                      height: 30,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text(
                          'پاسخ دهید',
                          style: TextStyle(color: LightColors.primary),
                        ),
                      ),
                    ),
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
          ),
          CommentReplyList(index: index),
        ],
      ),
    );
  }
}