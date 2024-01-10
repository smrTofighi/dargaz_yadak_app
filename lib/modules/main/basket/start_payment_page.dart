import 'package:car_soare_parts_app/core/styles/box_decoration.dart';
import 'package:car_soare_parts_app/core/styles/text_styles.dart';
import 'package:car_soare_parts_app/core/utils/dialogs.dart';
import 'package:car_soare_parts_app/core/utils/get_persian_number.dart';
import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/core/values/dimens.dart';
import 'package:car_soare_parts_app/core/values/icons.dart';
import 'package:car_soare_parts_app/modules/main/basket/basket_controller.dart';
import 'package:car_soare_parts_app/modules/main/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:car_soare_parts_app/core/utils/extensions.dart';

class StartPaymentPage extends StatelessWidget {
  StartPaymentPage({Key? key}) : super(key: key);
  final BasketController basketController = Get.find<BasketController>();
  final ProfileController profileController = Get.find<ProfileController>();
  final RxBool _desValidate = RxBool(false);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: ImageIcon(
              AppIcons.angleRight,
              size: 20,
              color: LightColors.primary,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0.5,
          centerTitle: true,
          title: Text(
            'نهایی کردن سبد خرید',
            style: LightTextStyles.normal16(LightColors.primary),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(AppDimens.medium),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'نام خریدار:',
                    style: LightTextStyles.normal14(LightColors.greyText),
                  ),
                  Text(profileController.userModel.value.fullName!),
                ],
              ),
              AppDimens.medium.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'آدرس:',
                    style: LightTextStyles.normal14(LightColors.greyText),
                  ),
                  Text(profileController.userModel.value.address!),
                ],
              ),
              AppDimens.medium.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'کد پستی :',
                    style: LightTextStyles.normal14(LightColors.greyText),
                  ),
                  Text(profileController.userModel.value.postalCode!),
                ],
              ),
              AppDimens.medium.height,
              Obx(
                () => TextField(
                  controller: basketController.descriptionText,
                  decoration: InputDecoration(
                    errorText: _desValidate.value
                        ? 'توضیحات نمیتواند خالی باشد'
                        : null,
                    labelText: 'توضیحات',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        AppDimens.radius,
                      ),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppDimens.radius),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppDimens.radius),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    floatingLabelStyle:
                        const TextStyle(color: LightColors.primary),
                  ),
                  cursorColor: LightColors.primary,
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: AppDimens.medium * 2),
                height: 2,
                width: AppDimens.infinity,
                decoration: AppBoxDecoration.divider,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: const Text(
                  'لیست محصولات :',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(
                width: AppDimens.sizeOfDevice(context).width,
                height: 200,
                child: ListView.builder(
                  itemBuilder: (context, index) => SizedBox(
                    width: 140,
                    height: 155,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(AppDimens.medium),
                              padding:
                                  const EdgeInsets.all(AppDimens.high * 1.5),
                              height: 100,
                              width: 100,
                              child: ImageIcon(AppIcons.cloudDisabled),
                            ),
                            Positioned(
                              bottom: 5,
                              left: 5,
                              child: Text(
                                basketController.basketList[index].count!,
                              ),
                            ),
                          ],
                        ),
                        AppDimens.small.height,
                        Text(basketController.basketList[index].title!)
                      ],
                    ),
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: basketController.basketList.length,
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          width: AppDimens.sizeOfDevice(context).width,
          height: 75,
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black38, blurRadius: 3, spreadRadius: 1)
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 40,
                width: AppDimens.sizeOfDevice(context).width * 0.35,
                child: ElevatedButton(
                  onPressed: () {
                    if (basketController.descriptionText.text == '') {
                      _desValidate(true);
                    } else {
                      _desValidate(false);
                      basketController.startBuy();
                      AppDialogs.loadingDialog();
                      Future.delayed(const Duration(seconds: 3), () {
                        Get.back();
                      });
                      basketController.getBasketList();
                    }
                  },
                  child: const Text(
                    'پرداخت',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'مبلغ قابل پرداخت',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    getPersianNumber(
                        basketController.totalPrice.value.toString()),
                    style: LightTextStyles.bold18(Colors.black),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
