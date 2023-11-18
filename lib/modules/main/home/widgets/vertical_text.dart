import 'package:car_soare_parts_app/core/styles/text_styles.dart';
import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/core/values/dimens.dart';
import 'package:car_soare_parts_app/core/values/icons.dart';
import 'package:flutter/material.dart';
import 'package:car_soare_parts_app/core/utils/extensions.dart';

class VerticalText extends StatelessWidget {
  const VerticalText({Key? key, required this.title, required this.onTap}) : super(key: key);
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RotatedBox(
        quarterTurns: -1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('مشاهده همه'),
                AppDimens.medium.width,
                RotatedBox(
                  quarterTurns: 5,
                  child: ImageIcon(
                    AppIcons.angleLeft,
                    size: 14,
                  ),
                ),
              ],
            ),
            AppDimens.medium.height,
            Text(
             title,
              style: LightTextStyles.bold22(LightColors.blackText),
            )
          ],
        ),
      ),
    );
  }
}
