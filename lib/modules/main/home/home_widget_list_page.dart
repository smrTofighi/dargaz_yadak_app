import 'dart:developer';
import 'package:car_soare_parts_app/core/styles/text_styles.dart';
import 'package:car_soare_parts_app/core/utils/get_persian_number.dart';
import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/core/values/dimens.dart';
import 'package:car_soare_parts_app/core/values/icons.dart';
import 'package:car_soare_parts_app/modules/main/home/home_controller.dart';
import 'package:car_soare_parts_app/modules/product/controller/product_list_controller.dart';
import 'package:car_soare_parts_app/modules/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:car_soare_parts_app/core/utils/extensions.dart';

class HomeWidgetListPage extends StatelessWidget {
  HomeWidgetListPage({Key? key}) : super(key: key);
  final ScrollController _scrollController = ScrollController();

  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: LightColors.white,
            automaticallyImplyLeading: false,
            elevation: 0,
            title: Text(
              homeController.titleAppBar.value,
              style: LightTextStyles.normal16(LightColors.primary),
            ),
            leading: IconButton(
              onPressed: () {
                Get.delete<ProductListController>();
                Get.back();
              },
              icon: ImageIcon(
                AppIcons.angleRight,
                size: 20,
                color: LightColors.primary,
              ),
            ),
            centerTitle: true,
          ),
          body: Obx(
            () => homeController.loading.value
                ? const Center(
                    child: LoadingWidget(
                      color: LightColors.primary,
                      size: 45,
                    ),
                  )
                : SizedBox(
                    width: AppDimens.sizeOfDevice(context).width,
                    child: NotificationListener<ScrollEndNotification>(
                      child: Obx(
                        () => homeController.homeWidgetDetailList.isEmpty
                            ? Center(
                                child: Text(
                                  'محصولی وجود ندارد',
                                  style: LightTextStyles.bold16(
                                      LightColors.blackText),
                                ),
                              )
                            : ListView.builder(
                                itemCount:
                                    homeController.homeWidgetDetailList.length,
                                controller: _scrollController,
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    margin:
                                        const EdgeInsets.all(AppDimens.medium),
                                    width:
                                        AppDimens.sizeOfDevice(context).width,
                                    height: 110,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 100,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                AppDimens.radius),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    homeController
                                                        .homeWidgetDetailList[
                                                            index]
                                                        .path!),
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        AppDimens.medium.width,
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              homeController
                                                  .homeWidgetDetailList[index]
                                                  .title!,
                                              style: LightTextStyles.bold16(
                                                  LightColors.blackText),
                                            ),
                                            Text(
                                              '${getPersianNumber(homeController.homeWidgetDetailList[index].price!)} تومان',
                                              style: LightTextStyles.normal14(
                                                  Colors.greenAccent),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                      ),
                      onNotification: (scrollEnd) {
                        final metrics = scrollEnd.metrics;
                        if (metrics.atEdge) {
                          bool isTop = metrics.pixels == 0;
                          if (isTop) {
                            log('At the top');
                          } else {}
                        }
                        return true;
                      },
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
