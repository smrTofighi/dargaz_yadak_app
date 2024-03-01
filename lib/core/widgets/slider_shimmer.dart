import 'package:car_soare_parts_app/core/styles/box_decoration.dart';
import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/core/values/dimens.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SliderShimmer extends StatelessWidget {
  const SliderShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: LightColors.shimmerColor,
      highlightColor: Colors.grey.shade400,
      child: Container(
        margin: const EdgeInsets.all(AppDimens.high),
        width: AppDimens.sizeOfDevice(context).width,
        height: AppDimens.sizeOfDevice(context).height * 0.22,
        decoration: AppBoxDecoration.shimmer,
      ),
    );
  }
}