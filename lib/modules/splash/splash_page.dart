import 'package:car_soare_parts_app/core/values/colors.dart';
import 'package:car_soare_parts_app/core/values/dimens.dart';
import 'package:car_soare_parts_app/gen/assets.gen.dart';
import 'package:car_soare_parts_app/modules/register/register_controller.dart';
import 'package:car_soare_parts_app/modules/widgets/loading.dart';
import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:car_soare_parts_app/core/utils/extensions.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final RegisterController controller = Get.find<RegisterController>();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then(
      (value) async {
        goToNextPage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: LightColors.scaffoldBG,
      body: SizedBox(
        width: AppDimens.sizeOfDevice(context).width,
        height: AppDimens.sizeOfDevice(context).height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            DelayedWidget(
              delayDuration: const Duration(milliseconds: 350),
              animationDuration: const Duration(seconds: 1),
              animation: DelayedAnimations.SLIDE_FROM_TOP,
              child: Column(
                children: [
                  Image.asset(
                    Assets.images.logoNew.path,
                    height: 160,
                  ),
                  AppDimens.high.height,
                  const Text(
                    'درگز یدک',
                    style: TextStyle(
                      color: LightColors.primary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Fanavari',
                    ),
                  ),
                ],
              ),
            ),
            AppDimens.high.height,
            const Spacer(),
            Center(
                child: Obx(() => controller.statusConnection.value
                    ? const LoadingWidget(
                        color: LightColors.loading,
                        size: 35,
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'به اینترنت متصل نیستید!',
                          ),
                          IconButton(
                              splashColor: Colors.red,
                              onPressed: () async {
                                goToNextPage();
                              },
                              icon: const Icon(
                                Icons.autorenew,
                                color: Colors.red,
                              ))
                        ],
                      ))),
            AppDimens.high.height,
          ],
        ),
      ),
    ));
  }

  goToNextPage() async {
    bool isConnect = await controller.checkConnectivity();
    if (isConnect) {
      controller.statusConnection.value = isConnect;
      Future.delayed(const Duration(seconds: 2))
          .then((value) => controller.checkUserIsLogin());
    } else {
      controller.statusConnection.value = isConnect;
    }
  }
}
