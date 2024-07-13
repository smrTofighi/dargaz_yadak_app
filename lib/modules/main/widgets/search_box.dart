import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/core/values/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
    required this.isEnabled,
    required this.onTap,
    this.controller,
    required this.searchValidate, required this.onTapIcon, required this.onChanged,
  });
  final TextEditingController? controller;
  final bool isEnabled;
  final Function() onTap;
  final RxBool searchValidate;
  final Function() onTapIcon;
  final Function() onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 6),
        margin: const EdgeInsets.symmetric(horizontal: AppDimens.medium),
        width: AppDimens.sizeOfDevice(context).width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimens.radius),
          color: LightColors.scaffoldBG,
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Obx(
          ()=> TextField(
            controller: controller,
            enabled: isEnabled,
            onChanged: onChanged(),
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: onTapIcon,
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey.shade500,
                  size: 18,
                ),
              ),
              errorText: searchValidate.value ? 'این فیلد نباید خالی باشد' : null,
              hintText: 'جستجو محصولات، برند ها و ... ',
              hintStyle: TextStyle(color: Colors.grey.shade600),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
