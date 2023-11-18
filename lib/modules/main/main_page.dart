import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/modules/main/basket/basket_list_page.dart';
import 'package:car_soare_parts_app/modules/main/brand/brand_page.dart';
import 'package:car_soare_parts_app/modules/main/drawer/drawer.dart';
import 'package:car_soare_parts_app/modules/main/home/home_controller.dart';
import 'package:car_soare_parts_app/modules/main/home/home_page.dart';
import 'package:car_soare_parts_app/modules/main/profile/profile_page.dart';
import 'package:car_soare_parts_app/modules/main/widgets/main_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/btm_nav_bar.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final RxInt selectedIndex = 0.obs;
  final GlobalKey<ScaffoldState> _ourKey = GlobalKey<ScaffoldState>();
  final List<Widget> pageViewWidgets = [
    HomePage(),
    //CategoryPage(),
    BrandPage(),
    BasketListPage(),
    ProfilePage(),
  ];
  final HomeController homeController = Get.find<HomeController>();
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _ourKey,
        backgroundColor: LightColors.scaffoldBG,
        drawer: AppDrawer(pageController: pageController),
        body: NestedScrollView(
          
          physics: const NeverScrollableScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            Obx(
              () => 
                
                  MainAppBar(ourKey: _ourKey,selectedIndex: selectedIndex.value),
            )
          ],
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (value) {
              selectedIndex.value = value;
            },
            controller: pageController,
            children: pageViewWidgets,
          ),
        ),
        extendBody: true,
        bottomNavigationBar: BtmNavBar(
          selectedIndex: selectedIndex,
          pageController: pageController,
        ),
      ),
    );
  }
}
