import 'package:car_soare_parts_app/core/styles/box_decoration.dart';
import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/core/values/dimens.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeProductListShimmer extends StatelessWidget {
  const HomeProductListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: LightColors.shimmerColor,
      highlightColor: Colors.grey.shade400,
      child: SizedBox(
                      height: 285,
                      child:  ListView.builder(
                          itemBuilder: (context, index) {
                         
                            return index == 0
                                ? Row(
                                  children: [
                                    Container(
                                  margin: const EdgeInsets.fromLTRB(6,16,16,16),
                                  width: 20,
                                  height: 150,
                                  decoration: AppBoxDecoration.shimmer,
                                ),Container(
                                  margin: const EdgeInsets.fromLTRB(16,32,16,32),
                                  width: 10,
                                  height: 100,
                                  decoration: AppBoxDecoration.shimmer,
                                ),
                                  ],
                                )
                                : const ProductItemShimmer();
                          },
                          itemCount:4,
                          scrollDirection: Axis.horizontal,
                        ),
                      
                    ),
    );
  }
}

class ProductItemShimmer extends StatelessWidget {
  const ProductItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
       padding: const EdgeInsets.all(AppDimens.small),
        margin: const EdgeInsets.all(8.0),
      decoration: AppBoxDecoration.shimmer,
      width: 200,
      height: 285,
      
    );
  }
}