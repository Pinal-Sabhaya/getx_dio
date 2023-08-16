import 'package:awesome_top_snackbar/awesome_top_snackbar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/constant/app_string.dart';
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

Future<void> openAndCloseLoadingDialog(bool isShowHide) async {
  if (Get.overlayContext != null) {
    if (isShowHide) {
      showDialog(
        context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (_) => WillPopScope(
          onWillPop: () async => false,
          child: const Center(
            child: SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      );
    } else {
      Navigator.pop(Get.overlayContext!);
    }
  }
}

Future<bool> checkConnectivity() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.none) {
    awesomeTopSnackbar(Get.context!, checkInternet);
    return false;
  } else {
    return true;
  }
}