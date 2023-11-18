import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:flutter/material.dart';

class MainTextField extends StatelessWidget {
  const MainTextField({
    super.key,
    required this.hintText,
    //required this.maxLength,
    required this.image,
    required this.controller,
    required this.errorText,
    required this.validate,
    this.textInputType = TextInputType.none
  });
  final TextEditingController controller;
  final String hintText;
  final TextInputType textInputType;
  //final int maxLength;
  final ImageProvider image;
  final String errorText;
  final bool validate;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: LightColors.primary,
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: hintText,
      
        errorText: validate ? errorText : null,
        icon: ImageIcon(
          image,
        ),
        iconColor: LightColors.grey,
      ),
    );
  }
}
