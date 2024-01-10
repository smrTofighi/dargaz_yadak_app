import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/core/values/icons.dart';
import 'package:car_soare_parts_app/core/values/strings.dart';
import 'package:car_soare_parts_app/gen/fonts.gen.dart';
import 'package:car_soare_parts_app/modules/main/widgets/search_box.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar(
      {Key? key, required this.ourKey, required this.selectedIndex})
      : super(key: key);
  final GlobalKey<ScaffoldState> ourKey;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      // bottom: const PreferredSize(
      //   preferredSize: Size.fromHeight(40),
      //   child: SearchBox(),
      // ),
      elevation: 1,
      backgroundColor: LightColors.scaffoldBG,
      title: Text(
        selectedIndex == 0
            ? AppStrings.appName
            : selectedIndex == 1
                ? AppStrings.brands
                : selectedIndex == 2
                    ? AppStrings.basket
                    : AppStrings.profile,
        style: const TextStyle(
          color: LightColors.primary,
          fontWeight: FontWeight.bold,
          fontFamily: FontFamily.fanavari,
          fontSize: 22,
        ),
      ),
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {
          ourKey.currentState!.openDrawer();
        },
        icon: ImageIcon(
          AppIcons.menuBurger,
          size: 20,
          color: LightColors.primary,
        ),
      ),
      // actions: [
      //   IconButton(
      //     onPressed: () {},
      //     icon: ImageIcon(
      //       AppIcons.search,
      //       size: 20,
      //       color: LightColors.primary,
      //     ),
      //   ),
      // ],
      centerTitle: true,
    );
  }
}
