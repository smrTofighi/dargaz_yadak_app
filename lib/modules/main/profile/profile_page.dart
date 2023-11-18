import 'dart:io';

import 'package:car_soare_parts_app/core/styles/box_decoration.dart';
import 'package:car_soare_parts_app/core/styles/text_styles.dart';
import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/core/values/dimens.dart';
import 'package:car_soare_parts_app/core/values/icons.dart';
import 'package:car_soare_parts_app/gen/assets.gen.dart';
import 'package:car_soare_parts_app/modules/main/profile/profile_controller.dart';
import 'package:car_soare_parts_app/modules/main/profile/widgets/list_tile_widget.dart';
import 'package:car_soare_parts_app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:car_soare_parts_app/core/utils/extensions.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  final ProfileController profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.high),
      child: Column(
        children: [
          AppDimens.high.height,
          Container(
            width: 75,
            height: 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1000),
              border: Border.all(color: Colors.black),
              image: DecorationImage(
                image: Image.asset(Assets.images.profileAvatar.path).image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          AppDimens.medium.height,
          Obx(
            () => Text(
              profileController.userModel.value.fullName!,
              style: LightTextStyles.bold16(
                LightColors.blackText,
              ),
            ),
          ),
          AppDimens.high.height,
          Container(
            margin: const EdgeInsets.symmetric(vertical: AppDimens.high),
            width: AppDimens.sizeOfDevice(context).width,
            height: 2,
            decoration: AppBoxDecoration.divider,
          ),
          ListTileWidet(
            title: 'اطلاعات حساب کاربری',
            icon: AppIcons.user,
            onTap: () {
              Get.toNamed(NamePages.userInfoPage);
            },
          ),
          ListTileWidet(
            title: 'سفارش ها',
            icon: AppIcons.shoppingCartCheck,
            onTap: () {
              Get.toNamed(NamePages.orderListPage);
            },
          ),
          ListTileWidet(
            title: 'مورد علاقه ها',
            icon: AppIcons.heart,
            onTap: () {
              Get.toNamed(NamePages.orderListPage);
            },
          ),
          ListTileWidet(
            title: 'خروج',
            icon: AppIcons.logout,
            onTap: () {
              exit(0);
            },
          ),
        ],
      ),
    );
  }
}
