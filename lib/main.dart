import 'package:awesome_top_snackbar/awesome_top_snackbar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:getxdemo/api_service/dio_client.dart';
import 'package:getxdemo/constant/app_colors.dart';
import 'package:getxdemo/constant/app_string.dart';
import 'package:getxdemo/pages/splash/splash_binding.dart';
import 'package:getxdemo/routes/apppages.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initServices();
  runApp(const MyApp());
  configLoading();
}


initServices() async {
  await Get.putAsync<DioClient>(() => DioClient().init());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialBinding: SplashBinding(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: Routes.splash,
      getPages: Routes.routes,
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

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 3000)
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = whiteColor
    ..backgroundColor = bgColor
    ..indicatorColor = whiteColor
    ..textColor = whiteColor
    ..maskColor = Colors.deepOrange.withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = false;
}