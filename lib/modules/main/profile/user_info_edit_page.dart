import 'package:car_soare_parts_app/core/styles/text_styles.dart';
import 'package:car_soare_parts_app/core/utils/get_persian_number.dart';
import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/core/values/dimens.dart';
import 'package:car_soare_parts_app/core/values/strings.dart';
import 'package:car_soare_parts_app/modules/main/profile/profile_controller.dart';
import 'package:car_soare_parts_app/modules/widgets/main_text_field_no_Icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserInfoEditPage extends StatefulWidget {
  const UserInfoEditPage({Key? key}) : super(key: key);

  @override
  State<UserInfoEditPage> createState() => _UserInfoEditPageState();
}

class _UserInfoEditPageState extends State<UserInfoEditPage> {
  final TextEditingController nameTextController = TextEditingController();

  final TextEditingController provinceIdTextController =
      TextEditingController();

  final TextEditingController addressTextController = TextEditingController();

  final TextEditingController postalCodeTextController =
      TextEditingController();

  final TextEditingController nationalCodeTextController =
      TextEditingController();

  final TextEditingController passwordTextController = TextEditingController();
  final ProfileController profileController = Get.find<ProfileController>();
  @override
  void initState() {
    super.initState();
    initialValues();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: LightColors.scaffoldBG,
        appBar: AppBar(
          backgroundColor: LightColors.primary,
          automaticallyImplyLeading: false,
          title: Text(
            'ویرایش اطلاعات شخصی',
            style: LightTextStyles.normal16(LightColors.whiteText),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
          child: SingleChildScrollView(
            child: Column(
              children: [
                MainTextFieldNoIcon(
                  controller: nameTextController,
                  lable: AppStrings.fullName,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                MainTextFieldNoIcon(
                  controller: provinceIdTextController,
                  lable: AppStrings.provinceId,
                  enabled: false,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                MainTextFieldNoIcon(
                  controller: addressTextController,
                  lable: AppStrings.address,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                MainTextFieldNoIcon(
                  controller: postalCodeTextController,
                  lable: AppStrings.postalCode,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                MainTextFieldNoIcon(
                  controller: nationalCodeTextController,
                  lable: AppStrings.nationalCode,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                MainTextFieldNoIcon(
                  controller: passwordTextController,
                  lable: AppStrings.password,
                ),
                const SizedBox(
                  height: 16.0,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: AppDimens.sizeOfDevice(context).width / 2.3,
                height: 45,
                child: OutlinedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text(
                    'لغو',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                width: AppDimens.sizeOfDevice(context).width / 2.3,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    profileController.updateUserInfo(
                        nameTextController.text,
                        addressTextController.text,
                        postalCodeTextController.text,
                        nationalCodeTextController.text,
                        provinceIdTextController.text,
                        passwordTextController.text);
                    Get.back();
                  },
                  child: const Text(
                    'ذخیره',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  initialValues() {
    nameTextController.text = profileController.userModel.value.fullName!;
    provinceIdTextController.text = getEnglishNumber(
        profileController.userModel.value.provinceId.toString());
    addressTextController.text =
        profileController.userModel.value.address.toString();
    nationalCodeTextController.text =
        profileController.userModel.value.nationalCode.toString();
    postalCodeTextController.text = getEnglishNumber(
        profileController.userModel.value.postalCode.toString());
  }
}
