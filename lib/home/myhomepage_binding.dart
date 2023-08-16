import 'package:get/get.dart';
import 'myhomepage_controller.dart';

class MyHomePage_binding extends Bindings {
  @override
  void dependencies() {
    Get.put<MyHomePageController>(MyHomePageController());
  }

}