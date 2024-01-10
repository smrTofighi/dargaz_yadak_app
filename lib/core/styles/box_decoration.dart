import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/core/values/dimens.dart';
import 'package:flutter/material.dart';

class AppBoxDecoration {
  static BoxDecoration productItemWidget = BoxDecoration(
    borderRadius: BorderRadius.circular(
      AppDimens.radius,
    ),
    color: Colors.grey.shade100.withOpacity(0.5),
    border: Border.all(color: Colors.black26),
  );
  static BoxDecoration imageOfProductItemWidget = BoxDecoration(
    borderRadius: BorderRadius.circular(AppDimens.radius),
    color: LightColors.white,
  );
  //? for List Tile Widget in Profile Page
  static BoxDecoration listTileWidget = BoxDecoration(
      borderRadius: BorderRadius.circular(AppDimens.small),
      color: LightColors.containerBGProfilePage,
      boxShadow: [
        BoxShadow(color: Colors.black12, blurRadius: 3, spreadRadius: 1)
      ]);

  //? This is for the container in list tile widget
  static BoxDecoration containerInListTileWidget = BoxDecoration(
    borderRadius: BorderRadius.circular(4),
    color: LightColors.white,
  );

  static BoxDecoration divider = BoxDecoration(
    borderRadius: BorderRadius.circular(100),
    color: LightColors.grey,
  );

  static BoxDecoration comment = BoxDecoration(
    borderRadius: BorderRadius.circular(AppDimens.radius),
    color: LightColors.white,
    boxShadow: [
      BoxShadow(
        color: LightColors.black.withOpacity(0.4),
        blurRadius: 2,
      )
    ],
  );

  static BoxDecoration bottomNavigation = BoxDecoration(
    boxShadow: [
      BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 5,
          spreadRadius: 0.1,
          offset: Offset(0, -5)),
    ],
    color: LightColors.scaffoldBG,
  );
}
