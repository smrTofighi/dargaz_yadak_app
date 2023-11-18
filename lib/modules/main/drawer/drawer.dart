import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_soare_parts_app/core/styles/box_decoration.dart';
import 'package:car_soare_parts_app/core/styles/text_styles.dart';
import 'package:car_soare_parts_app/core/utils/storage_key.dart';
import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/core/values/dimens.dart';
import 'package:car_soare_parts_app/core/values/icons.dart';
import 'package:car_soare_parts_app/core/values/strings.dart';
import 'package:car_soare_parts_app/gen/assets.gen.dart';
import 'package:car_soare_parts_app/modules/main/home/home_controller.dart';
import 'package:car_soare_parts_app/modules/main/profile/profile_controller.dart';
import 'package:car_soare_parts_app/modules/product/controller/product_list_controller.dart';
import 'package:car_soare_parts_app/modules/widgets/loading.dart';
import 'package:car_soare_parts_app/routes/pages.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({Key? key, required this.pageController}) : super(key: key);
  final HomeController homeController = Get.find<HomeController>();
  final ProfileController profileController = Get.find<ProfileController>();
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(AppDimens.medium),
          //   child: ExpandablePanel(
          //       controller: ExpandableController(initialExpanded: true),
          //       header: const Text('برند ها'),
          //       collapsed: Obx(
          //         () => SizedBox(
          //           width: AppDimens.infinity,
          //           height: homeController.productBrandList.length * 48,
          //           child: ListView.builder(
          //             physics: const NeverScrollableScrollPhysics(),
          //             itemBuilder: (context, index) => ListTile(
          //               onTap: () {
          //                 ProductListController controller =
          //                     Get.put(ProductListController());
          //                 int id = homeController.productBrandList[index].id!;
          //                 controller.brandId.value = id;
          //                 controller.isBrand.value = true;
          //                 controller.getProductBrand();
          //                 Get.toNamed(NamePages.productListPage);
          //               },
          //               leading: Container(
          //                 width: 45,
          //                 height: 45,
          //                 child: CachedNetworkImage(
          //                   imageUrl: homeController
          //                           .productBrandList[index].image!.path ??
          //                       '',
          //                   placeholder: (context, url) => const LoadingWidget(
          //                       color: LightColors.primary, size: 30),
          //                   errorWidget: (context, url, error) => Center(
          //                     child: ImageIcon(AppIcons.cloudDisabled),
          //                   ),
          //                 ),
          //               ),
          //               title:
          //                   Text(homeController.productBrandList[index].title!),
          //             ),
          //             itemCount: homeController.productBrandList.length,
          //             shrinkWrap: true,
          //           ),
          //         ),
          //       ),
          //       expanded: const SizedBox()),
          // ),
          // Container(
          //   width: AppDimens.infinity,
          //   height: 1,
          //   decoration: AppBoxDecoration.divider,
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(AppDimens.medium),
          //   child: ExpandablePanel(
          //     controller: ExpandableController(initialExpanded: true),
          //     header: const Text('دسته بندی ها'),
          //     collapsed: Obx(
          //       () => SizedBox(
          //         width: AppDimens.infinity,
          //         height: homeController.productCategoryList.length * 48,
          //         child: ListView.builder(
          //           physics: const NeverScrollableScrollPhysics(),
          //           itemBuilder: (context, index) => ListTile(
          //             onTap: () {
          //               ProductListController controller =
          //                   Get.put(ProductListController());

          //               int id = homeController.productCategoryList[index].id!;
          //               controller.categoryId.value = id;
          //               controller.isBrand.value = false;

          //               Get.find<ProductListController>().getProductCategory();
          //               Get.toNamed(NamePages.productListPage);
          //             },
          //             leading: ImageIcon(
          //               Image.asset(Assets.images.saipa.path).image,
          //               color: LightColors.primary,
          //             ),
          //             title: Text(
          //                 homeController.productCategoryList[index].title!),
          //           ),
          //           itemCount: homeController.productCategoryList.length,
          //           shrinkWrap: true,
          //         ),
          //       ),
          //     ),
          //     expanded: const SizedBox(),
          //   ),
          // ),
          // Container(
          //   width: AppDimens.infinity,
          //   height: 1,
          //   decoration: AppBoxDecoration.divider,
          // ),

          Container(
            padding: const EdgeInsets.only(right: 16, bottom: 16),
            margin: const EdgeInsets.only(bottom: 12),
            width: AppDimens.infinity,
            height: 180,
            color: LightColors.primary,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Obx(
                () => profileController.userModel.value.fullName!.isEmpty ? LoadingWidget(color: Colors.white, size: 25) : Text(
                  "${profileController.userModel.value.fullName!} خوش آمدید",
                  style: LightTextStyles.bold18(LightColors.whiteText),
                ),
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Get.back();
              pageController.animateToPage(
                4,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
            leading: ImageIcon(
              AppIcons.user,
              color: LightColors.primary,
            ),
            title: const Text(AppStrings.profile),
          ),
          ListTile(
            onTap: () {
              Get.back();
              pageController.animateToPage(
                4,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
            leading: ImageIcon(
              AppIcons.shoppingCartCheck,
              color: LightColors.primary,
            ),
            title: const Text('سفارش ها'),
          ),
          ListTile(
            onTap: () {
              Get.back();
              pageController.animateToPage(
                4,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
            leading: ImageIcon(
              AppIcons.heart,
              color: LightColors.primary,
            ),
            title: const Text('مورد علاقه ها'),
          ),
          ListTile(
            onTap: () {
              Get.back();
              pageController.animateToPage(
                4,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
            leading: ImageIcon(
              AppIcons.homeLocation,
              color: LightColors.primary,
            ),
            title: const Text('آدرس ها'),
          ),
          ListTile(
            onTap: () {
              Get.toNamed(NamePages.aboutUsPage);
            },
            leading: ImageIcon(
              AppIcons.info,
              color: LightColors.primary,
            ),
            title: const Text('درباره ما'),
          ),
          ListTile(
            onTap: () {
              Get.offAllNamed(NamePages.loginPage);
              GetStorage().remove(StorageKeys.token);
              GetStorage().remove(StorageKeys.userId);
            },
            leading: ImageIcon(
              AppIcons.signOut,
              color: LightColors.primary,
            ),
            title: const Text(AppStrings.logOut),
          ),
        ],
      ),
    );
  }
}
