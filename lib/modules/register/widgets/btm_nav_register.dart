import 'package:car_soare_parts_app/core/styles/text_styles.dart';
import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:car_soare_parts_app/core/utils/extensions.dart';
import '../../../core/values/dimens.dart';

class BtmNavRegister extends StatelessWidget {
  const BtmNavRegister({
    Key? key,
    required this.onPressedBigBtn,
    required this.onPreesedTextBtn,
    required this.bigButtonText,
    required this.textMessage,
    required this.smallButtonText,
  }) : super(key: key);
  final Function() onPressedBigBtn;
  final Function() onPreesedTextBtn;
  final String bigButtonText;
  final String smallButtonText;
  final String textMessage;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppDimens.high),
      width: AppDimens.sizeOfDevice(context).width,
     
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: AppDimens.sizeOfDevice(context).width,
            height: 55,
            child: ElevatedButton(
              onPressed: onPressedBigBtn,
              child: Text(
                bigButtonText,
                style: LightTextStyles.normal18(LightColors.whiteText),
              ),
            ),
          ),
          AppDimens.medium.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textMessage,
                style: LightTextStyles.normal14(LightColors.blackText),
              ),
              TextButton(
                onPressed: onPreesedTextBtn,
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.transparent),
                ),
                child: Text(
                  smallButtonText,
                  style: LightTextStyles.normal14(LightColors.primary),
                ),
              )
            ],
          ),
          AppDimens.small.height,
          Center(
            child: TextButton(
              onPressed: onPreesedTextBtn,
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.transparent),
              ),
              child: Text(
                'فراموشی رمز عبور',
                style: LightTextStyles.normal14(LightColors.primary),
              ),
            ),
          )
        ],
      ),
    );
  }
}
