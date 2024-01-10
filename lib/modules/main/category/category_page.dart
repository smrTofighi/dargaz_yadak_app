import 'package:car_soare_parts_app/core/utils/extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_soare_parts_app/core/styles/text_styles.dart';
import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/core/values/dimens.dart';
import 'package:car_soare_parts_app/core/values/icons.dart';
import 'package:car_soare_parts_app/modules/main/home/home_controller.dart';
import 'package:car_soare_parts_app/modules/product/controller/product_list_controller.dart';
import 'package:car_soare_parts_app/modules/widgets/loading.dart';
import 'package:car_soare_parts_app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({Key? key}) : super(key: key);
  final HomeController homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: AppDimens.small / 2,
        right: AppDimens.small,
        left: AppDimens.small,
      ),
      width: AppDimens.sizeOfDevice(context).width,
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: AppDimens.medium,
          mainAxisSpacing: AppDimens.medium,
          mainAxisExtent: AppDimens.sizeOfDevice(context).height / 6,
        ),
        itemCount: homeController.productCategoryList.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            ProductListController controller = Get.put(ProductListController());
            Get.toNamed(NamePages.productListPage);
            int id = homeController.productCategoryList[index].id!;
            controller.categoryId.value = id;


            Get.find<ProductListController>().getProductCategory();
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: LightColors.containerBGProfilePage,
                gradient: const LinearGradient(
                    colors: GradientColors.greyToWhite,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: AppDimens.infinity,
                  height: AppDimens.sizeOfDevice(context).height / 10,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(4),
                    ),
                  ),
                  child: CachedNetworkImage(
                    imageUrl:
                        homeController.productCategoryList[index].icon ?? '',
                    placeholder: (context, url) => const LoadingWidget(
                        color: LightColors.primary, size: 30),
                    errorWidget: (context, url, error) => Center(
                      child: ImageIcon(AppIcons.cloudDisabled),
                    ),
                  ),
                ),
                Text(homeController.productCategoryList[index].title!),
                AppDimens.small.height,
                Text(
                  '1000+ کالا',
                  style: LightTextStyles.normal12(LightColors.greyText),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
