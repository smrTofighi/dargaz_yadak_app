import 'package:car_soare_parts_app/core/styles/text_styles.dart';
import 'package:car_soare_parts_app/core/utils/dialogs.dart';
import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/core/values/dimens.dart';
import 'package:car_soare_parts_app/core/values/icons.dart';
import 'package:car_soare_parts_app/modules/product/comment/widgets/comment_list.dart';
import 'package:car_soare_parts_app/modules/product/controller/product_single_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:car_soare_parts_app/core/utils/extensions.dart';
import 'package:validators/validators.dart';

class CommentPage extends StatelessWidget {
  CommentPage({Key? key}) : super(key: key);
  final ProductSingleController productSingleController =
      Get.find<ProductSingleController>();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Text(
            'نظرات کاربران',
            style: LightTextStyles.normal16(LightColors.primary),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: ImageIcon(
              AppIcons.angleRight,
              color: LightColors.primary,
              size: 20,
            ),
          ),
          centerTitle: true,
        ),
        body: SizedBox(
          width: AppDimens.sizeOfDevice(context).width,
          child: CommentList(),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: LightColors.primary,
          child: ImageIcon(
            AppIcons.commentAlt,
            color: Colors.white,
          ),
          onPressed: () {
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
                          controller:productSingleController.emailController,
                          onChanged: (value) {
                            productSingleController.isEmail2.value = isEmail(value);
                          },
                          decoration: InputDecoration(
                            errorText: productSingleController.emailValidate.value
                                ? 'فرمت ایمیل صحیح نمیباشد'
                                : null,
                            hintText: 'ایمیل',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(AppDimens.radius),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(AppDimens.radius),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(AppDimens.radius),
                                borderSide:
                                    BorderSide(color: LightColors.primary)),
                          ),
                        ),
                      ),
                      Obx(
                        () => TextField(
                          maxLines: 6,
                          cursorColor: LightColors.primary,
                          controller: productSingleController.commentController,
                          decoration: InputDecoration(
                            errorText: productSingleController.commentValidate.value
                                ? 'حداقل تعداد کاراکتر باید بیشتر از 10 تا باشد'
                                : null,
                            hintText: 'نظر خود را بنویسید',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(AppDimens.radius),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(AppDimens.radius),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(AppDimens.radius),
                                borderSide:
                                    BorderSide(color: LightColors.primary)),
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
                                if (productSingleController.commentController.text.length <= 10) {
                                  productSingleController.commentValidate(true);
                                } else {
                                  productSingleController.commentValidate(false);
                                }
                                if (!productSingleController.isEmail2.value ||
                                    productSingleController.emailController.text.isEmpty) {
                                  productSingleController.emailValidate(true);
                                } else {
                                  productSingleController.emailValidate(false);
                                }
                                if (!productSingleController.commentValidate.value &&
                                    !productSingleController.emailValidate.value) {
                                  productSingleController.addCommentProduct(
                                      productSingleController.emailController.text,
                                      productSingleController.commentController.text,
                                      context);

                                  productSingleController.commentController.text = '';
                                  productSingleController.emailController.text = '';
                                  productSingleController.commentValidate(false);
                                  productSingleController.emailValidate(false);
                                  productSingleController.isEmail2(true);
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
                                productSingleController.commentController.text = '';
                                productSingleController.emailController.text = '';
                                productSingleController.commentValidate(false);
                                productSingleController.emailValidate(false);
                                productSingleController.isEmail2(true);
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
          },
        ),
      ),
    );
  }
}
