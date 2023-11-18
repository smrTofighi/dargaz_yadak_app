//? this widget is a slider in top page
import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/core/values/dimens.dart';
import 'package:car_soare_parts_app/modules/main/home/home_controller.dart';
import 'package:car_soare_parts_app/modules/widgets/loading.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:car_soare_parts_app/core/utils/extensions.dart';

class HomeSlider extends StatelessWidget {
  HomeSlider({
    super.key,
  });
  final CarouselController _carouselController = CarouselController();
  final HomeController homeController = Get.find<HomeController>();
  final RxInt dotsIndex = RxInt(0);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => homeController.widgetList.isEmpty
          ? SizedBox(
              height: AppDimens.sizeOfDevice(context).height * 0.2,
              child: const Center(
                child: LoadingWidget(color: LightColors.primary, size: 30),
              ),
            )
          : GestureDetector(
              onTap: () {
                homeController.getHomeWidgetList(
                    homeController.homeWidgetList[dotsIndex.value].id!);
                homeController.titleAppBar.value =
                    homeController.homeWidgetList[dotsIndex.value].title!;
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: CarouselSlider(
                      items: homeController.widgetList,
                      carouselController: _carouselController,
                      options: CarouselOptions(
                        autoPlay: true,
                        onPageChanged: (index, reason) {
                          dotsIndex.value = index;
                        },
                        
                        enlargeCenterPage: true,
                        viewportFraction: 0.9,
                        aspectRatio: 20 / 10,
                        enableInfiniteScroll: false,
                        pageSnapping: false,
                      ),
                    ),
                  ),
                  AppDimens.small.height,
                  Obx(
                    () => DotsIndicator(
                      dotsCount: homeController.homeWidgetList.length,
                      position: dotsIndex.value,
                      decorator: const DotsDecorator(
                        color: LightColors.black, // Inactive color
                        activeColor: LightColors.primary,
                        spacing: EdgeInsets.all(4),
                        activeSize: Size.square(8.0),
                        size: Size.square(8.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
