import 'package:car_soare_parts_app/core/values/dimens.dart';
import 'package:car_soare_parts_app/modules/main/brand/widgets/brand_widget.dart';
import 'package:car_soare_parts_app/modules/main/home/home_controller.dart';
import 'package:car_soare_parts_app/modules/product/controller/product_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandPage extends StatelessWidget {
  BrandPage({Key? key}) : super(key: key);
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
          mainAxisExtent: AppDimens.sizeOfDevice(context).height / 5,
        ),
        itemCount: homeController.productBrandList.length,
        itemBuilder: (context, index) {
          var title = homeController.productBrandList[index].title!;
          var path = homeController.productBrandList[index].image!.path!;

          return BrandWidget(
            title: title,
            path: path,
            onTap: () {
              ProductListController controller =
                  Get.put(ProductListController());
              int id = homeController.productBrandList[index].id!;
              controller.brandId.value = id;
              controller.isBrand.value = true;
              controller.titleAppBar(
                  "برند ${homeController.productBrandList[index].title!}");
              controller.getProductBrand();
            },
          );
        },
      ),
    );
  }
}
