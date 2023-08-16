import 'package:get/get.dart';
import 'homepage_controller.dart';

class MyHomePage_binding extends Bindings {
  @override
  void dependencies() {
    Get.put<MyHomePageController>(MyHomePageController());
  }

}