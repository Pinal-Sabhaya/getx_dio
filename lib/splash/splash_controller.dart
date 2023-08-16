import 'package:get/get.dart';
import 'package:getxdemo/routes/apppages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 4), () => Get.toNamed(AppPages.MYHOMEPAGE));
  }
}
