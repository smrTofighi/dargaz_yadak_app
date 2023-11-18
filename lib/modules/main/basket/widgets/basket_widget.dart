import 'package:car_soare_parts_app/core/styles/text_styles.dart';
import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/core/values/dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/values/icons.dart';

class BasketWidget extends StatelessWidget {
  const BasketWidget({
    Key? key,
    required this.title,
    required this.count,
    required this.price,
    required this.onTap,
    required this.onPressedDelete,
    required this.increase,
    required this.decrease,
  }) : super(key: key);
  final String title;
  final String count;
  final String price;
  final Function() onTap;
  final Function() onPressedDelete;
  final Function() increase;
  final Function() decrease;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppDimens.medium,
        vertical: AppDimens.small,
      ),
      width: AppDimens.sizeOfDevice(context).width,
      height: 85,
      child: Row(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(24),
                  margin: const EdgeInsets.only(left: 12),
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppDimens.radius),
                      color: Colors.grey.shade200),
                  child: ImageIcon(AppIcons.cloudDisabled),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: AppDimens.sizeOfDevice(context).width * 0.3,
                      child: Text(title,
                          maxLines: 2,
                          style: LightTextStyles.bold14(LightColors.black)),
                    ),
                    Text(
                      "$price تومان",
                      style: LightTextStyles.bold14(LightColors.primary),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Spacer(),
                Container(
                  height: 35,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppDimens.radius),
                    border: Border.all(
                      color: LightColors.grey,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: increase,
                        child: const Icon(
                          CupertinoIcons.add,
                          color: LightColors.primary,
                          size: 18,
                        ),
                      ),
                      Text(
                        count,
                        style: LightTextStyles.normal18(LightColors.primary),
                      ),
                      GestureDetector(
                        onTap: decrease,
                        child: count == '1'
                            ? ImageIcon(
                                AppIcons.trash,
                                color: Colors.red,
                                size: 18,
                              )
                            : const Icon(
                                CupertinoIcons.minus,
                                color: LightColors.primary,
                                size: 18,
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
