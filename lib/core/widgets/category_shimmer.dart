import 'package:car_soare_parts_app/core/styles/box_decoration.dart';
import 'package:car_soare_parts_app/core/utils/extensions.dart';
import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/core/values/dimens.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class CategoryShimmerList extends StatelessWidget {
  const CategoryShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade500,
    highlightColor: Colors.grey.shade400,
      child: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CategoryShimmer(),
              CategoryShimmer(),
              CategoryShimmer(),
              CategoryShimmer(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CategoryShimmer(),
              CategoryShimmer(),
              CategoryShimmer(),
              CategoryShimmer(),
            ],
          ),
        ],
      ),
    );
  }
}

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(AppDimens.small),
          margin: const EdgeInsets.all(AppDimens.small),
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimens.high),
            color: LightColors.shimmerColor,
          ),
        ),
        (AppDimens.small / 2).height,
        Container(
          height: 5,
          width: 60,
          decoration: AppBoxDecoration.shimmer,
        )
      ],
    );
  }
}
