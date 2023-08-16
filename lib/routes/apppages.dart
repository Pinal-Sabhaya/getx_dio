import 'package:get/get.dart';
import 'package:getxdemo/pages/home/homepage_binding.dart';
import 'package:getxdemo/pages/home/homepage_view.dart';
import 'package:getxdemo/pages/login/login_binding.dart';
import 'package:getxdemo/pages/login/login_view.dart';
import 'package:getxdemo/pages/splash/splash_binding.dart';
import 'package:getxdemo/pages/splash/splash_view.dart';

class Routes {
  static const homePage = "/homepage";
  static const splash = "/splash";
  static const login = "/login";

  static final routes = [
    GetPage(name: homePage, page: () => const MyHomePageView(), binding: MyHomePage_binding()),
    GetPage(name: splash, page: () => const SplashView(), binding: SplashBinding()),
    GetPage(name: login, page: () => LoginView(), binding: LoginBinding()),
  ];
}
