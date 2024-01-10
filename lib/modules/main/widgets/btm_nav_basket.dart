import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BtmNavBasket extends StatelessWidget {
  const BtmNavBasket({
    super.key,
    required this.icon,
    required this.count,
  });
  final ImageProvider icon;
  final RxInt count;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(8.0),
          child: ImageIcon(
            icon,
            color: LightColors.white,
            size: 26,
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Obx(
            () => Visibility(
              visible: count.value < 1 ? false : true,
              child: Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.red),
                child: Center(
                  child: Text(
                    count.value.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
