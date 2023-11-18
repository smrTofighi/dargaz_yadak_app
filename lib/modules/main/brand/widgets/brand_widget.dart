import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_soare_parts_app/core/styles/text_styles.dart';
import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/core/values/dimens.dart';
import 'package:car_soare_parts_app/core/values/icons.dart';
import 'package:car_soare_parts_app/modules/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:car_soare_parts_app/core/utils/extensions.dart';

class BrandWidget extends StatelessWidget {
  const BrandWidget(
      {Key? key, required this.title, required this.path, required this.onTap})
      : super(key: key);
  final String title;
  final String path;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: LightColors.containerBGProfilePage,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 3,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: AppDimens.infinity,
              height: AppDimens.sizeOfDevice(context).height / 10,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
              ),
              child: CachedNetworkImage(
                imageUrl: path,
                placeholder: (context, url) =>
                    const LoadingWidget(color: LightColors.primary, size: 30),
                errorWidget: (context, url, error) => Center(
                  child: ImageIcon(AppIcons.cloudDisabled),
                ),
              ),
            ),
            Text(title),
            AppDimens.small.height,
            Text(
              '1000+ کالا',
              style: LightTextStyles.normal12(LightColors.greyText),
            ),
          ],
        ),
      ),
    );
  }
}
