import 'dart:developer';

import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/core/values/dimens.dart';
import 'package:car_soare_parts_app/core/values/icons.dart';
import 'package:car_soare_parts_app/core/values/strings.dart';
import 'package:car_soare_parts_app/gen/assets.gen.dart';
import 'package:car_soare_parts_app/modules/register/register_controller.dart';
import 'package:car_soare_parts_app/modules/register/widgets/btm_nav_register.dart';
import 'package:car_soare_parts_app/modules/register/widgets/main_textfield_widget.dart';
import 'package:car_soare_parts_app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:car_soare_parts_app/core/utils/extensions.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final RxBool _validatePhone = false.obs;
  final RxBool _validatePass = false.obs;

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
                Lottie.asset(Assets.json.animation1),
                const Text(
                  'ورود',
                  style: TextStyle(
                      fontSize: 22,
                      color: LightColors.darkBlueText,
                      fontWeight: FontWeight.w500),
                ),
                AppDimens.high.height,
                Obx(
                  () => MainTextField(
                    controller: _mobileController,
                    errorText: AppStrings.phoneNumberCanNotEmpty,
                    validate: _validatePhone.value,
                    hintText: 'شماره موبایل',
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
                    hintText: 'رمز عبور',
                    image: AppIcons.lock,
                    textInputType: TextInputType.visiblePassword,
                  ),
                ),
                (AppDimens.high * 1.5).height,
                BtmNavRegister(
                  onPressedBigBtn: () {
                    loginProccess(context);
                  },
                  onPreesedTextBtn: () {
                    Get.offNamed(NamePages.registerPage);
                  },
                  bigButtonText: AppStrings.login,
                  textMessage: AppStrings.dontYouHaveAnyAccount,
                  smallButtonText: AppStrings.signup,
                ),
              ],
            ),
          ),
        ),
        // extendBody: true,
        // bottomNavigationBar: BtmNavRegister(
        //   onPressedBigBtn: () {
        //     loginProccess();
        //   },
        //   onPreesedTextBtn: () {
        //     Get.offNamed(PageNames.registerPage);
        //   },
        //   bigButtonText: AppStrings.login,
        //   textMessage: AppStrings.dontYouHaveAnyAccount,
        //   smallButtonText: AppStrings.signup,
        // ),
      ),
    );
  }

  loginProccess(BuildContext context) {
    _mobileController.text.isEmpty
        ? _validatePhone.value = true
        : _validatePhone.value = false;
    _passwordController.text.isEmpty
        ? _validatePass.value = true
        : _validatePass.value = false;

    if (_validatePhone.value == false && _validatePass.value == false) {
      RegisterController controller = Get.find<RegisterController>();
      controller.logInUser(_mobileController.text, _passwordController.text, context);
      log('true');
    }
  }
}
