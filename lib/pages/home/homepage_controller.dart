import 'dart:convert';

import 'package:awesome_top_snackbar/awesome_top_snackbar.dart';
import 'package:get/get.dart';
import 'package:getxdemo/api_service/api_constant.dart';
import 'package:getxdemo/api_service/api_service.dart';
import 'package:getxdemo/constant/app_string.dart';
import 'package:getxdemo/main.dart';
import 'package:getxdemo/pages/home/model/home_response_model.dart';

class MyHomePageController extends GetxController {

  final homeDataResponse = <HomeModel>[].obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    getHomeData();
  }

  getHomeData() async {
    checkConnectivity().then((connectivity) {
      if (connectivity) {
        openAndCloseLoadingDialog(true);
        ApiService.callGetApi(ApiConstant.baseUrl + ApiConstant.getHomeData, Get.context!, () {
          openAndCloseLoadingDialog(false);
        }).then((response) {
          openAndCloseLoadingDialog(false);
          if (response == null) {
            awesomeTopSnackbar(Get.context!, msgSomethingWentWrong);
          } else {
            homeDataResponse.value = homeModelFromJson(jsonEncode(response));
            // separateData(newsEventsResponseModelFromJson(jsonEncode(response)));
          }
        });
      }
    });
  }
}
