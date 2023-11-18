import 'package:car_soare_parts_app/core/styles/box_decoration.dart';
import 'package:car_soare_parts_app/core/styles/text_styles.dart';
import 'package:car_soare_parts_app/core/utils/get_persian_number.dart';
import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/core/values/dimens.dart';
import 'package:car_soare_parts_app/core/values/icons.dart';
import 'package:car_soare_parts_app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderListPage extends StatelessWidget {
  const OrderListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: LightColors.scaffoldBG,
        appBar: AppBar(
          backgroundColor: LightColors.primary,
          automaticallyImplyLeading: false,
          title: Text(
            'لیست سفارش ها',
            style: LightTextStyles.normal16(LightColors.whiteText),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: ImageIcon(
              AppIcons.angleRight,
              size: 20,
            ),
          ),
          centerTitle: true,
        ),
        body: SizedBox(
          width: AppDimens.sizeOfDevice(context).width,
          child: ListView.builder(
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Get.toNamed(NamePages.orderSinglePage);
              },
              child: Container(
                padding: const EdgeInsets.all(AppDimens.small),
                margin: const EdgeInsets.all(AppDimens.small),
                width: AppDimens.infinity,
                height: 65,
                decoration: AppBoxDecoration.listTileWidget,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'سفارش ${getPersianNumber('14')}',
                          style:
                              LightTextStyles.normal14(LightColors.blackText),
                        ),
                        Text(
                          '${getPersianNumber('1402')}/${getPersianNumber('05')}/${getPersianNumber('31')}',
                          style: LightTextStyles.normal12(LightColors.greyText),
                        ),
                      ],
                    ),
                    Text(
                      '${getPersianNumber('1500000')} تومان',
                      style: LightTextStyles.bold14(Colors.greenAccent),
                    ),
                    ImageIcon(
                      AppIcons.angleLeft,
                      size: 16,
                    )
                  ],
                ),
              ),
            ),
            itemCount: 3,
            scrollDirection: Axis.vertical,
          ),
        ),
      ),
    );
  }
}
