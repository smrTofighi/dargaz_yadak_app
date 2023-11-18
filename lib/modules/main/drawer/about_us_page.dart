import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/core/values/dimens.dart';
import 'package:car_soare_parts_app/core/values/icons.dart';
import 'package:car_soare_parts_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:car_soare_parts_app/core/utils/extensions.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            AppDimens.medium.height,
            Lottie.asset(Assets.json.aboutUs),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '''وب سایت فروشگاهی قطعات یدکی درگز یدک
در خدمت همه ی هم میهنان عزیز در هرنقطه از کشور
پهناورمان می باشد. ما در این مجموعه تضمین کیفیت و قیمت را داریم.
جهت برقراری ارتباط با ما و یا طرح سوال میتوانید از طریق کامنت گذاری و
یا باشماره تلفن ما در تماس باشید.''',
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton.icon(
                onPressed: () {},
                icon: ImageIcon(AppIcons.telegram),
                label: const Text('تلگرام'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton.icon(
                onPressed: () {},
                icon: ImageIcon(
                  AppIcons.instagram,
                  color: Colors.red,
                ),
                label: const Text('اینستاگرام',
                    style: TextStyle(color: Colors.red)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton.icon(
                onPressed: () {},
                icon: ImageIcon(
                  AppIcons.whatsapp,
                  color: Colors.green,
                ),
                label:
                    const Text('واتساپ', style: TextStyle(color: Colors.green)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton.icon(
                onPressed: () {
                  _launchUrl();
                },
                icon: ImageIcon(
                  AppIcons.globe,
                  color: LightColors.primary,
                ),
                label: const Text(
                  'وب سایت',
                  style: TextStyle(color: LightColors.primary),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse('https://dargaz-yadak.ir'))) {
      throw Exception('Could not launch');
    }
  }
}
