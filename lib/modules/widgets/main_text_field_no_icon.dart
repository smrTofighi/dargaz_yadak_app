import 'package:car_soare_parts_app/core/styles/text_styles.dart';
import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:flutter/material.dart';

class MainTextFieldNoIcon extends StatelessWidget {
  const MainTextFieldNoIcon({
    super.key,
    required this.controller,
    required this.lable,
    this.enabled = true,
    this.type = TextInputType.text

  });

  final TextEditingController controller;
  final String lable;
  final bool enabled;
  final TextInputType type;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: lable,
        labelStyle: LightTextStyles.normal14(LightColors.greyText),
      ),
      enabled: enabled,
      keyboardType: type,
    );
  }
}
