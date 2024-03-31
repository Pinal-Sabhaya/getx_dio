import 'package:get/get.dart';
import 'package:getxdemo/pages/login/login_controller.dart';
import 'package:getxdemo/repository/auth_repository.dart';
import 'package:getxdemo/repository/auth_repository_imp.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl());
    Get.put<LoginController>(LoginController());
  }
}
