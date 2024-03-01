import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_soare_parts_app/core/styles/box_decoration.dart';
import 'package:car_soare_parts_app/core/styles/text_styles.dart';
import 'package:car_soare_parts_app/core/utils/extensions.dart';
import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/core/values/dimens.dart';
import 'package:car_soare_parts_app/core/values/icons.dart';
import 'package:car_soare_parts_app/core/values/strings.dart';
import 'package:car_soare_parts_app/modules/product/controller/product_single_controller.dart';
import 'package:car_soare_parts_app/modules/product/widgets/btm_nav_product.dart';
import 'package:car_soare_parts_app/modules/widgets/loading.dart';
import 'package:car_soare_parts_app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validators/validators.dart';

class ProductSinglePage extends StatelessWidget {
  ProductSinglePage({Key? key}) : super(key: key);
  final ProductSingleController productController =
      Get.find<ProductSingleController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          Get.delete<ProductSingleController>();
          return true;
        },
        child: Scaffold(
          backgroundColor: LightColors.scaffoldBG,
          body: Obx(
            () => productController.loading.value
                ? const Center(
                    child: LoadingWidget(color: LightColors.primary, size: 55),
                  )
                : productController.productModel.value.price == null
                    ? const Center(
                        child:
                            LoadingWidget(color: LightColors.primary, size: 55),
                      )
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            TopSection(),
                            ProductName(),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                margin: const EdgeInsets.only(left: 6),
                                width: 130,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '4.5',
                                      style: LightTextStyles.normal14(
                                          Colors.yellow.shade900),
                                    ),
                                    ImageIcon(
                                      AppIcons.starFill,
                                      color: Colors.yellow.shade900,
                                      size: 16,
                                    ),
                                    ImageIcon(
                                      AppIcons.starFill,
                                      color: Colors.yellow.shade900,
                                      size: 16,
                                    ),
                                    ImageIcon(
                                      AppIcons.starFill,
                                      color: Colors.yellow.shade900,
                                      size: 16,
                                    ),
                                    ImageIcon(
                                      AppIcons.starFill,
                                      color: Colors.yellow.shade900,
                                      size: 16,
                                    ),
                                    ImageIcon(
                                      AppIcons.starFill,
                                      color: Colors.yellow.shade900,
                                      size: 16,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: AppDimens.medium,
                                  horizontal: AppDimens.small),
                              width: AppDimens.infinity,
                              height: 1,
                              decoration: AppBoxDecoration.divider,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  0, 4, AppDimens.high, 4),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'توضیحات',
                                  style: LightTextStyles.normal16(
                                      LightColors.greyText),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(AppDimens.high,
                                  0, AppDimens.high, AppDimens.high),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  AppStrings.test,
                                  style: LightTextStyles.normal14(
                                      LightColors.blackText),
                                ),
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.fromLTRB(
                            //       0, 4, AppDimens.high, 4),
                            //   child: Align(
                            //     alignment: Alignment.centerRight,
                            //     child: Text(
                            //       'برند',
                            //       style: LightTextStyles.normal16(
                            //           LightColors.greyText),
                            //     ),
                            //   ),
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.fromLTRB(AppDimens.high,
                            //       4, AppDimens.high, AppDimens.high),
                            //   child: Align(
                            //     alignment: Alignment.centerRight,
                            //     child: TextButton(
                            //       onPressed: () {},
                            //       style: const ButtonStyle(
                            //           alignment: Alignment.centerRight),
                            //       child: Text(
                            //         'برند',
                            //         style: LightTextStyles.bold16(
                            //             LightColors.primary),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            CommentsList(),
                            (AppDimens.high * 10).height
                          ],
                        ),
                      ),
          ),
          extendBody: true,
          bottomNavigationBar: BtmNavProduct(
            price: productController.productModel.value.price!,
            onPressed: () {
              String id = productController.productModel.value.id.toString();
              log(id);

              String count = '1';
              productController.addProductToBasketList(id, count, context);
            },
          ),
        ),
      ),
    );
  }
}

class CommentsList extends StatelessWidget {
  CommentsList({
    super.key,
  });
  final ProductSingleController controller =
      Get.find<ProductSingleController>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: AppDimens.sizeOfDevice(context).width,
        height: controller.commentList.isEmpty ? 150 : 200,
        child: Obx(
          () => controller.commentList.isEmpty
              ? GestureDetector(
                  onTap: () {
                    commentBottomSheet(context);
                  },
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        'نظر خود را در مورد کالا بنویسید',
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Icon(
                        Icons.add,
                        size: 32,
                        color: LightColors.primary,
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemBuilder: (context, index) => index == 3
                      ? GestureDetector(
                          onTap: () {
                            Get.toNamed(NamePages.commentPage);
                          },
                          child: SizedBox(
                            width: AppDimens.sizeOfDevice(context).width * 0.40,
                            height: 180,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ImageIcon(
                                  AppIcons.angleLeft,
                                  color: LightColors.primary,
                                ),
                                AppDimens.high.height,
                                Text(
                                  'مشاهده همه',
                                  style: LightTextStyles.bold16(
                                      LightColors.primary),
                                ),
                              ],
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            Get.toNamed(NamePages.commentPage);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(AppDimens.medium),
                            margin: const EdgeInsets.all(AppDimens.small),
                            width: AppDimens.sizeOfDevice(context).width * 0.75,
                            height: 180,
                            decoration: AppBoxDecoration.comment,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.commentList[index].comment,
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  style: LightTextStyles.normal16(
                                      LightColors.black),
                                ),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'یک روز پیش',
                                      style: LightTextStyles.normal12(
                                          LightColors.greyText),
                                    ),
                                    Text(
                                      controller.commentList[index].fullName,
                                      style: LightTextStyles.normal12(
                                          LightColors.greyText),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                  itemCount: 3 + 1,
                  scrollDirection: Axis.horizontal,
                ),
        ));
  }

  commentBottomSheet(context) {
    Get.bottomSheet(
        isDismissible: false,
        Container(
          padding: const EdgeInsets.all(AppDimens.small),
          width: AppDimens.sizeOfDevice(context).width,
          height: AppDimens.sizeOfDevice(context).height * 0.6,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppDimens.radius),
                topRight: Radius.circular(AppDimens.radius),
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'افزودن نظر جدید',
                style: LightTextStyles.normal14(LightColors.primary),
              ),
              Obx(
                () => TextField(
                  cursorColor: LightColors.primary,
                  controller: controller.emailController,
                  onChanged: (value) {
                    controller.isEmail2.value = isEmail(value);
                  },
                  decoration: InputDecoration(
                    errorText: controller.emailValidate.value
                        ? 'فرمت ایمیل صحیح نمیباشد'
                        : null,
                    hintText: 'ایمیل',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppDimens.radius),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppDimens.radius),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppDimens.radius),
                        borderSide: BorderSide(color: LightColors.primary)),
                  ),
                ),
              ),
              Obx(
                () => TextField(
                  maxLines: 6,
                  cursorColor: LightColors.primary,
                  controller: controller.commentController,
                  decoration: InputDecoration(
                    errorText: controller.commentValidate.value
                        ? 'حداقل تعداد کاراکتر باید بیشتر از 10 تا باشد'
                        : null,
                    hintText: 'نظر خود را بنویسید',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppDimens.radius),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppDimens.radius),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppDimens.radius),
                        borderSide: BorderSide(color: LightColors.primary)),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: AppDimens.sizeOfDevice(context).width / 2.3,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        if (controller.commentController.text.length <= 10) {
                          controller.commentValidate(true);
                        } else {
                          controller.commentValidate(false);
                        }
                        if (!controller.isEmail2.value ||
                            controller.emailController.text.isEmpty) {
                          controller.emailValidate(true);
                        } else {
                          controller.emailValidate(false);
                        }
                        if (!controller.commentValidate.value &&
                            !controller.emailValidate.value) {
                          controller.addCommentProduct(
                              controller.emailController.text,
                              controller.commentController.text,
                              context);

                          controller.commentController.text = '';
                          controller.emailController.text = '';
                          controller.commentValidate(false);
                          controller.emailValidate(false);
                          controller.isEmail2(true);
                        }
                      },
                      child: const Text(
                        'ثبت',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: AppDimens.sizeOfDevice(context).width / 2.3,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                        controller.commentController.text = '';
                        controller.emailController.text = '';
                        controller.commentValidate(false);
                        controller.emailValidate(false);
                        controller.isEmail2(true);
                      },
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.red)),
                      child: const Text(
                        'لغو',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent);
  }
}

class ProductName extends StatelessWidget {
  ProductName({super.key});
  final ProductSingleController productController =
      Get.find<ProductSingleController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 4, AppDimens.high, AppDimens.high),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          productController.productModel.value.title!,
          style: LightTextStyles.bold22(LightColors.blackText),
        ),
      ),
    );
  }
}

class TopSection extends StatelessWidget {
  TopSection({
    super.key,
  });

  final ProductSingleController productController =
      Get.find<ProductSingleController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(AppDimens.high),
          width: AppDimens.sizeOfDevice(context).width,
          height: AppDimens.sizeOfDevice(context).height * 0.35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
          ),
          child: CachedNetworkImage(
            imageUrl: productController.imageModel.value.path!,
            placeholder: (context, url) =>
                const LoadingWidget(color: LightColors.primary, size: 30),
            errorWidget: (context, url, error) => const Center(
              child: Text('error'),
            ),
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          left: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Get.delete<ProductSingleController>();
                  Get.back();
                },
                icon: ImageIcon(
                  AppIcons.angleRight,
                  color: LightColors.primary,
                ),
              ),
              Row(
                children: [
                  // IconButton(
                  //   onPressed: () {},
                  //   icon:
                  //       ImageIcon(AppIcons.shoppingCart),
                  // ),
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: ImageIcon(
                  //     AppIcons.heart,
                  //     color: LightColors.primary,
                  //   ),
                  // ),
                  AppDimens.medium.width,
                  IconButton(
                    onPressed: () {},
                    icon: ImageIcon(
                      AppIcons.share,
                      color: LightColors.primary,
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
