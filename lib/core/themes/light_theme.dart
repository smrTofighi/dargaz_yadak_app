import 'package:car_soare_parts_app/core/styles/text_styles.dart';
import 'package:car_soare_parts_app/core/values/dimens.dart';
import 'package:car_soare_parts_app/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

import '../values/colors.dart';

ThemeData lightTheme() {
  return ThemeData(
    fontFamily: FontFamily.dana,
    inputDecorationTheme: inputDecoration(),
    elevatedButtonTheme: elevatedButtomTheme(),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.radius),
          ),
        ),
        side: const MaterialStatePropertyAll(
          BorderSide(
            color: LightColors.primary,
          ),
        ),
      ),
    ),
  );
}

ElevatedButtonThemeData elevatedButtomTheme() {
  return ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: const MaterialStatePropertyAll(LightColors.primary),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.radius),
        ),
      ),
    ),
  );
}

InputDecorationTheme inputDecoration() {
  return InputDecorationTheme(
    hintStyle: LightTextStyles.normal14(LightColors.greyText),
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: LightColors.grey),
    ),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: LightColors.primary, width: 2),
    ),
    border: const UnderlineInputBorder(
      borderSide: BorderSide(color: LightColors.grey),
    ),
  );
}
