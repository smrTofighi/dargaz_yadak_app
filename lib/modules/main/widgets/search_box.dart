import 'package:car_soare_parts_app/core/styles/text_styles.dart';
import 'package:car_soare_parts_app/core/utils/extensions.dart';
import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/core/values/dimens.dart';
import 'package:car_soare_parts_app/core/values/icons.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      margin: const EdgeInsets.symmetric(horizontal: AppDimens.medium),
      height: 40,
      width: AppDimens.sizeOfDevice(context).width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimens.radius),
        color: LightColors.scaffoldBG,
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          ImageIcon(
            AppIcons.search,
            size: 20,
          ),
          AppDimens.medium.width,
          Text(
            'جستجو محصولات، برند ها و ... ',
            style: LightTextStyles.normal12(LightColors.blackText),
          ),
        ],
      ),
    );
  }
}