import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/core/widgets/home_product_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class GridViewProductShimmer extends StatelessWidget {
  const GridViewProductShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 320,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: LightColors.shimmerColor,
            highlightColor: Colors.grey.shade400,
            child: const ProductItemShimmer(),
          );
        });
  }
}
