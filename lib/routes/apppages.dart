import 'package:get/get.dart';
import 'package:getxdemo/home/myhomepage_view.dart';
import 'package:getxdemo/home/myhomepage_binding.dart';
import 'package:getxdemo/splash/splash_binding.dart';
import 'package:getxdemo/splash/splash_view.dart';


class AppPages {
  static const MYHOMEPAGE = "/myhomepage";
  static const SPLASH = "/splash";

  static final routes = [
    GetPage(
        name: MYHOMEPAGE,
        page: () => MyHomePageView(),
        binding: MyHomePage_binding()),
    GetPage(
        name: SPLASH,
        page: () => SplashView(),
        binding: SplashBinding()),
  ];
}
