import 'package:car_soare_parts_app/core/values/dimens.dart';
import 'package:flutter/material.dart';

class SlideWidget extends StatelessWidget {
  const SlideWidget({Key? key, required this.title, required this.image})
      : super(key: key);
  final String title;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          width: AppDimens.sizeOfDevice(context).width,
          height: AppDimens.sizeOfDevice(context).height * 0.31,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: Image.asset(image).image,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(AppDimens.radius)),
          // foregroundDecoration: BoxDecoration(
          //     gradient: const LinearGradient(
          //       colors: [
          //         LightColors.primary,
          //         Colors.transparent,
          //       ],
          //       begin: Alignment.bottomCenter,
          //       end: Alignment.center,
          //     ),
          //     borderRadius: BorderRadius.circular(AppDimens.radius)),
        ),
        // Positioned(
        //   bottom: 4,
        //   right: 10,
        //   child: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Text(
        //       title,
        //       style: TextStyle(
        //           color: Colors.white,
        //           fontWeight: FontWeight.bold,
        //           fontSize: 18),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
