import 'package:car_soare_parts_app/core/styles/box_decoration.dart';
import 'package:car_soare_parts_app/core/styles/text_styles.dart';
import 'package:car_soare_parts_app/core/utils/get_persian_number.dart';
import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/core/values/dimens.dart';
import 'package:car_soare_parts_app/core/values/icons.dart';
import 'package:car_soare_parts_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:car_soare_parts_app/core/utils/extensions.dart';

class OrderSinglePage extends StatelessWidget {
  const OrderSinglePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: LightColors.primary,
          automaticallyImplyLeading: false,
          title: Text(
            'سفارش شماره ${getPersianNumber('14')}',
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
        body: Padding(
          padding: const EdgeInsets.all(AppDimens.medium),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'کد سفارش:',
                      style: LightTextStyles.normal14(LightColors.greyText),
                    ),
                    Text(
                      getPersianNumber('14'),
                    ),
                  ],
                ),
                AppDimens.medium.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'تاریخ ثبت سفارش:',
                      style: LightTextStyles.normal14(LightColors.greyText),
                    ),
                    Text(
                      '${getPersianNumber('1402')}/${getPersianNumber('06')}/${getPersianNumber('20')}',
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: AppDimens.medium * 2),
                  height: 2,
                  width: AppDimens.infinity,
                  decoration: AppBoxDecoration.divider,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'تحویل گیرنده:',
                      style: LightTextStyles.normal14(LightColors.greyText),
                    ),
                    const Text(
                      'سیدمحمدرضاتوفیقی',
                    ),
                  ],
                ),
                AppDimens.medium.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'شماره تماس:',
                      style: LightTextStyles.normal14(LightColors.greyText),
                    ),
                    Text(
                      getPersianNumber('09225566325'),
                    ),
                  ],
                ),
                AppDimens.medium.height,
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'آدرس:',
                    style: LightTextStyles.normal14(LightColors.greyText),
                  ),
                ),
                AppDimens.medium.height,
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'فارس، شهر داراب، خیابان پیروزی، کوچه شهید محمدی، پلاک ${getPersianNumber('6')}',
                    style: LightTextStyles.normal14(LightColors.blackText),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: AppDimens.medium * 2),
                  height: 2,
                  width: AppDimens.infinity,
                  decoration: AppBoxDecoration.divider,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'مبلغ کل:',
                      style: LightTextStyles.normal14(LightColors.greyText),
                    ),
                    Text(
                      '${getPersianNumber('123000')} تومان',
                    ),
                  ],
                ),
                AppDimens.medium.height,
                TextButton.icon(
                  onPressed: () {
                    Get.defaultDialog();
                  },
                  icon: ImageIcon(
                    AppIcons.caretDown,
                    color: LightColors.primary,
                  ),
                  label: const Text(
                    'مشاهده فاکتور',
                    style: TextStyle(color: LightColors.primary),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: AppDimens.medium * 2),
                  height: 2,
                  width: AppDimens.infinity,
                  decoration: AppBoxDecoration.divider,
                ),
                SizedBox(
                  width: AppDimens.sizeOfDevice(context).width,
                  child: ListView.builder(
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.all(AppDimens.medium),
                        width: AppDimens.sizeOfDevice(context).width,
                        height: 110,
                        child: Row(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(AppDimens.radius),
                                image: DecorationImage(
                                  image: Image.asset(Assets.images.tara.path)
                                      .image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            AppDimens.medium.width,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'محصول شماره ${getPersianNumber((index + 1).toString())}',
                                  style: LightTextStyles.bold16(
                                      LightColors.blackText),
                                ),
                                Text(
                                  '${getPersianNumber('50000')} تومان',
                                  style: LightTextStyles.normal14(
                                    Colors.greenAccent,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    itemCount: 5,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
