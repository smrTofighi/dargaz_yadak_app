import 'dart:io';

import 'package:car_soare_parts_app/core/themes/light_theme.dart';
import 'package:car_soare_parts_app/modules/register/register_binding.dart';
import 'package:car_soare_parts_app/routes/pages.dart';
import 'package:car_soare_parts_app/routes/routes.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}



void main() {
  GetStorage.init();
   HttpOverrides.global = MyHttpOverrides();
  runApp(
    DevicePreview(
      builder: (context) {
        return const MyApp();
      },
      enabled: true,
    ),
  );
  //runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: lightTheme(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa', 'IR'), // Farsi, Iran
      ],
      locale: const Locale('fa', 'IR'),
      debugShowCheckedModeBanner: false,
      getPages: routes,
      initialBinding: RegisterBinding(),
      initialRoute: NamePages.splashPage,
    );
  }
}
