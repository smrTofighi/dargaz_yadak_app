import 'package:car_soare_parts_app/core/styles/text_styles.dart';
import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/core/values/dimens.dart';
import 'package:car_soare_parts_app/core/values/icons.dart';
import 'package:car_soare_parts_app/core/values/strings.dart';
import 'package:car_soare_parts_app/modules/main/profile/profile_controller.dart';
import 'package:car_soare_parts_app/modules/main/profile/widgets/divider_widget.dart';
import 'package:car_soare_parts_app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:car_soare_parts_app/core/utils/extensions.dart';

class UserInfoPage extends StatelessWidget {
  UserInfoPage({Key? key}) : super(key: key);
  final ProfileController profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: LightColors.primary,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: ImageIcon(
            AppIcons.angleRight,
            size: 20,
          ),
        ),
        title: Text(
          AppStrings.userInfo,
          style: LightTextStyles.normal16(LightColors.whiteText),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: LightColors.scaffoldBG,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            AppDimens.high.height,
            // Container(
            //   margin: const EdgeInsets.only(top: 8, bottom: 16),
            //   width: 75,
            //   height: 75,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(8),
            //     image: DecorationImage(
            //       image: Image.asset(Assets.images.profileAvatar.path).image,
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: AppDimens.sizeOfDevice(context).height / 2.8,
                  width: AppDimens.sizeOfDevice(context).width / 3,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                    color: LightColors.primary.withOpacity(0.5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('نام و نام خانوادگی :'),
                      ),
                      DividerWidget(
                        height: 1,
                        width: AppDimens.infinity,
                        color: LightColors.white,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('شماره موبایل :'),
                      ),
                      DividerWidget(
                        height: 1,
                        width: AppDimens.infinity,
                        color: LightColors.white,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('آدرس :'),
                      ),
                      DividerWidget(
                        height: 1,
                        width: AppDimens.infinity,
                        color: LightColors.white,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('کد پستی :'),
                      ),
                      DividerWidget(
                        height: 1,
                        width: AppDimens.infinity,
                        color: LightColors.white,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('کد ملی :'),
                      ),
                      DividerWidget(
                        height: 1,
                        width: AppDimens.infinity,
                        color: LightColors.white,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('کشور :'),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: AppDimens.sizeOfDevice(context).width / 1.7,
                  height: AppDimens.sizeOfDevice(context).height / 2.8,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                    border: Border.all(
                      color: LightColors.primary.withOpacity(0.5),
                    ),
                  ),
                  child: Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child:
                              Text(profileController.userModel.value.fullName!),
                        ),
                        DividerWidget(
                          height: 1,
                          width: AppDimens.infinity,
                          color: LightColors.primary.withOpacity(0.5),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child:
                              Text(profileController.userModel.value.mobile!),
                        ),
                        DividerWidget(
                          height: 1,
                          width: AppDimens.infinity,
                          color: LightColors.primary.withOpacity(0.5),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child:
                              Text(profileController.userModel.value.address!),
                        ),
                        DividerWidget(
                          height: 1,
                          width: AppDimens.infinity,
                          color: LightColors.primary.withOpacity(0.5),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                              profileController.userModel.value.postalCode!),
                        ),
                        DividerWidget(
                          height: 1,
                          width: AppDimens.infinity,
                          color: LightColors.primary.withOpacity(0.5),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                              profileController.userModel.value.provinceId!),
                        ),
                        DividerWidget(
                          height: 1,
                          width: AppDimens.infinity,
                          color: LightColors.primary.withOpacity(0.5),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(profileController
                              .userModel.value.nationalCode
                              .toString()),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppDimens.high),
        child: SizedBox(
          width: AppDimens.infinity,
          height: 45,
          child: ElevatedButton(
            onPressed: () {
              Get.toNamed(NamePages.userInfoEditPage);
            },
            child: const Text(
              'ویرایش اطلاعات',
            ),
          ),
        ),
      ),
    );
  }
}
