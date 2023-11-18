import 'dart:developer';

import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/core/values/dimens.dart';
import 'package:car_soare_parts_app/core/values/icons.dart';
import 'package:car_soare_parts_app/core/values/strings.dart';
import 'package:car_soare_parts_app/gen/assets.gen.dart';
import 'package:car_soare_parts_app/modules/register/widgets/btm_nav_register.dart';
import 'package:car_soare_parts_app/modules/register/widgets/main_textfield_widget.dart';
import 'package:car_soare_parts_app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:car_soare_parts_app/core/utils/extensions.dart';

import '../register_controller.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final RxBool _validatePhone = false.obs;
  final RxBool _validatePass = false.obs;
  final RxBool _validateName = false.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.high, vertical: AppDimens.medium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Lottie.asset(Assets.json.animation3),
                const Text(
                  AppStrings.signup,
                  style: TextStyle(
                      fontSize: 22,
                      color: LightColors.darkBlueText,
                      fontWeight: FontWeight.w500),
                ),
                AppDimens.high.height,
                Obx(
                  () => MainTextField(
                    controller: _nameController,
                    errorText: AppStrings.nameCanNotEmpty,
                    validate: _validateName.value,
                    hintText: AppStrings.name,
                    image: AppIcons.manHead,
                    textInputType: TextInputType.name,
                  ),
                ),
                AppDimens.high.height,
                Obx(
                  () => MainTextField(
                    controller: _mobileController,
                    errorText: AppStrings.phoneNumberCanNotEmpty,
                    validate: _validatePhone.value,
                    hintText: AppStrings.numberPhone,
                    image: AppIcons.phoneNotch,
                    textInputType: TextInputType.phone,
                  ),
                ),
                AppDimens.high.height,
                Obx(
                  () => MainTextField(
                    controller: _passwordController,
                    errorText: AppStrings.passwordCanNotEmpty,
                    validate: _validatePass.value,
                    hintText: AppStrings.password,
                    image: AppIcons.lock,
                    textInputType: TextInputType.visiblePassword,
                  ),
                ),
                (AppDimens.high * 1.5).height,
                BtmNavRegister(
                  onPressedBigBtn: () {
                    registerProccess();
                  },
                  onPreesedTextBtn: () {
                    Get.offNamed(NamePages.loginPage);
                  },
                  bigButtonText: AppStrings.signup,
                  textMessage: AppStrings.doYouHaveAnAccount,
                  smallButtonText: AppStrings.login,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  registerProccess() {
    _mobileController.text.isEmpty
        ? _validatePhone.value = true
        : _validatePhone.value = false;
    _passwordController.text.isEmpty
        ? _validatePass.value = true
        : _validatePass.value = false;
    _nameController.text.isEmpty
        ? _validateName.value = true
        : _validateName.value = false;

    if (_validatePhone.value == false &&
        _validatePass.value == false &&
        _validateName.value == false) {
      RegisterController controller = Get.find<RegisterController>();
      controller.registerUser(_nameController.text, _mobileController.text,
          _passwordController.text);
    }
  }
}
