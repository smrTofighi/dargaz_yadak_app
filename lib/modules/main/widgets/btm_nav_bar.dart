import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/core/values/icons.dart';
import 'package:car_soare_parts_app/modules/main/widgets/btm_nav_item.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BtmNavBar extends StatelessWidget {
  const BtmNavBar(
      {Key? key, required this.selectedIndex, required this.pageController})
      : super(key: key);
  final RxInt selectedIndex;

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CurvedNavigationBar(
        items: [
          BtmNavItem(
            icon: AppIcons.home,
          ),
          BtmNavItem(
            icon: AppIcons.layoutFluid,
          ),
          // BtmNavItem(
          //   icon: AppIcons.grid,
          // ),
          BtmNavItem(
            icon: AppIcons.shoppingCart,
          ),
          BtmNavItem(
            icon: AppIcons.user,
          ),
        ],
        backgroundColor: Colors.transparent,
        color: LightColors.primary,
        height: 65,
        buttonBackgroundColor: LightColors.primary,
        index: selectedIndex.value,
        onTap: (index) {
          pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
          selectedIndex(index);
        },
      ),
    );
  }
}
