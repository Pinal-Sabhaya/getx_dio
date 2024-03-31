import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:getxdemo/repository/auth_repository.dart';
import 'package:getxdemo/routes/apppages.dart';
import 'package:getxdemo/utils/logger_util.dart';
import 'package:getxdemo/utils/storage_utils.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final passwordVisibility = false.obs;
  final _authRepository = Get.find<AuthRepository>();

/*
  //using dio
  void loginApi() async {
    Map<String, String> loginParam = {'username': 'kminchelle', 'password': '0lelplR'};

    DioClient().request(ApiConstant.login, MethodType.post, loginParam).then((response) async {
      if (response == null) {
        awesomeTopSnackbar(Get.context!, msgSomethingWentWrong);
      } else {
        Get.toNamed(Routes.homePage);
        StorageUtil.setData(StorageUtil.keyLoginData, response.toString());
        print("GetLoginData===> ${await StorageUtil.getData(StorageUtil.keyLoginData)}");
      }
    });
  }*/

  void loginApi() async {
    EasyLoading.show();
    try {
      var loginInResponse = await _authRepository.doLogin(
        username: /*emailController.value.text*/ "kminchelle",
        password: /*passwordController.value.text*/ "0lelplR",
      );

      EasyLoading.dismiss();
      if (loginInResponse != null) {
        StorageUtil.setData(
            StorageUtil.keyLoginData, loginInResponse.toString());
        Get.toNamed(Routes.homePage);
      } else {
        print("login==> ${loginInResponse.username}");
        logger.e(loginInResponse.username);
      }
    } catch (error) {
      EasyLoading.dismiss();
      logger.e("Controller>>>>>> error $error");
    }
  }
}
