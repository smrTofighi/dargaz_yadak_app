import 'package:car_soare_parts_app/core/styles/text_styles.dart';
import 'package:car_soare_parts_app/core/utils/extensions.dart';
import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/core/values/dimens.dart';
import 'package:car_soare_parts_app/core/values/strings.dart';
import 'package:car_soare_parts_app/core/widgets/grid_view_product_shimmer.dart';
import 'package:car_soare_parts_app/gen/fonts.gen.dart';
import 'package:car_soare_parts_app/modules/main/widgets/search_box.dart';
import 'package:car_soare_parts_app/modules/product/controller/product_single_controller.dart';
import 'package:car_soare_parts_app/modules/product/widgets/product_list_item.dart';
import 'package:car_soare_parts_app/modules/search/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  final RxBool searchValidate = RxBool(false);
  final SearchProductController searchController =
      Get.find<SearchProductController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 3,
            title: const Text(
              AppStrings.appName,
              style: TextStyle(
                color: LightColors.primary,
                fontWeight: FontWeight.bold,
                fontFamily: FontFamily.fanavari,
                fontSize: 24,
              ),
            ),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Get.back();
                Get.delete<SearchProductController>();
              },
              icon: const Icon(Icons.close),
              color: LightColors.primary,
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: SearchBox(
                controller: searchController.searchTextController,
                isEnabled: true,
                onTap: () {},
                searchValidate: searchValidate,
                onTapIcon: () {
                  if (searchController.searchTextController.text == '') {
                    searchValidate(true);
                  } else {
                    searchValidate(false);
                    searchController.searchProduct();
                  }
                },
              ),
            )),
        body: Column(
          children: [
            AppDimens.small.height,
            AppDimens.small.height,
            Expanded(
              child: Obx(
                () =>searchController.loading.value ? const GridViewProductShimmer() :  searchController.searchList.isEmpty
                    ? Center(
                        child: Text(
                          'محصولی یافت نشد',
                          style: LightTextStyles.bold16(LightColors.blackText),
                        ),
                      )
                    : SearchProductList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SearchProductList extends StatelessWidget {
  SearchProductList({
    super.key,
  });

  final SearchProductController searchController =
      Get.find<SearchProductController>();
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 320,
        ),
        itemCount: searchController.searchList.length,
        itemBuilder: (context, index) {
          var title = searchController.searchList[index].product.title;
          var price = searchController.searchList[index].product.price;
          RxBool isLiked = true.obs;
          var image = searchController.searchList[index].image.path;
          //? that widget was return
          return ProductListItem(
              title: title,
              price: price,
              rating: '4.8',
              image: image,
              onTap: () {
                ProductSingleController controller =
                    Get.put(ProductSingleController());
                controller.productId.value =
                    searchController.searchList[index].product.id;

                controller.getProduct();
                controller.getProductComments();
              },
              onTapLike: () {},
              isLiked: isLiked);
        });
  }
}
