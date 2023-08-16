import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/home/myhomepage_binding.dart';
import 'package:getxdemo/routes/apppages.dart';
import 'package:getxdemo/splash/splash_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialBinding: SplashBinding(),
      initialRoute: AppPages.SPLASH,
      getPages: AppPages.routes,
      enableLog: true,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        bottomSheetTheme:
            BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
