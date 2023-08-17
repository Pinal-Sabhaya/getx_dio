import 'package:awesome_top_snackbar/awesome_top_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getxdemo/api_service/api_constant.dart';
import 'package:getxdemo/api_service/api_service.dart';
import 'package:getxdemo/api_service/dio_client.dart';
import 'package:getxdemo/constant/app_string.dart';
import 'package:getxdemo/enums/method_type.dart';
import 'package:getxdemo/main.dart';
import 'package:getxdemo/routes/apppages.dart';
import 'package:getxdemo/utils/storage_utils.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final passwordVisibility = false.obs;


  //using http
/*  void loginApi() async {
    Map<String, String> loginParam = {'username': 'kminchelle', 'password': '0lelplR'};

    checkConnectivity().then((connectivity) {
      if (connectivity) {
        openAndCloseLoadingDialog(true);
        ApiService.callPostApi(ApiConstant.login, loginParam, () {
          openAndCloseLoadingDialog(false);
        }).then((response) async {
          openAndCloseLoadingDialog(false);
          if (response == null) {
            awesomeTopSnackbar(Get.context!, msgSomethingWentWrong);
          } else {
            StorageUtil.setData(StorageUtil.keyLoginData, response.toString());
            print("GetLoginData===> ${await StorageUtil.getData(StorageUtil.keyLoginData)}");
          }
        });
      }
    });
  }*/

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
  }
}
