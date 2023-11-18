import 'package:car_soare_parts_app/core/styles/box_decoration.dart';
import 'package:car_soare_parts_app/core/styles/text_styles.dart';
import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/core/values/dimens.dart';
import 'package:car_soare_parts_app/core/values/icons.dart';
import 'package:flutter/material.dart';
import 'package:car_soare_parts_app/core/utils/extensions.dart';

class ListTileWidet extends StatelessWidget {
  const ListTileWidet({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final ImageProvider icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: AppDimens.small),
        padding: const EdgeInsets.symmetric(horizontal: AppDimens.medium),
        width: AppDimens.sizeOfDevice(context).width,
        height: 55,
        decoration: AppBoxDecoration.listTileWidget,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  width: 40,
                  height: 40,
                  decoration: AppBoxDecoration.containerInListTileWidget,
                  child: ImageIcon(icon),
                ),
                AppDimens.high.width,
                Text(
                  title,
                  style: LightTextStyles.normal14(LightColors.blackText),
                )
              ],
            ),
            ImageIcon(
              AppIcons.angleLeft,
              size: 16,
            )
          ],
        ),
      ),
    );
  }
}
