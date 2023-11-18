import 'package:car_soare_parts_app/core/styles/text_styles.dart';
import 'package:car_soare_parts_app/core/values/dimens.dart';
import 'package:flutter/material.dart';
import 'package:car_soare_parts_app/core/utils/extensions.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.title,
    required this.onTap,
    required this.colors,
    required this.icon,
  });
  final String title;
  final Function() onTap;
  final List<Color> colors;
  final ImageProvider icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(AppDimens.small),
            margin: const EdgeInsets.all(AppDimens.small),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimens.high),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: colors,
              ),
            ),
            child: ImageIcon(
              icon,
              color: Colors.white,
            ),
          ),
          (AppDimens.small / 2).height,
          Text(
            title,
            style: LightTextStyles.bold14(Colors.black),
          )
        ],
      ),
    );
  }
}
