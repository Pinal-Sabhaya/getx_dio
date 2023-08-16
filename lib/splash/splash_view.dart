import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getxdemo/constant/app_images.dart';
import 'package:getxdemo/splash/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(imgSplash, fit: BoxFit.fill, width: double.infinity, height: double.infinity),
    );
  }
}
