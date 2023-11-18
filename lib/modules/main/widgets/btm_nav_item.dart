import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:flutter/material.dart';

class BtmNavItem extends StatelessWidget {
  const BtmNavItem({
    super.key,
    
    required this.icon,

  });
  final ImageProvider icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      child: ImageIcon(
        icon,
        color: LightColors.white,
      ),
    );
  }
}
