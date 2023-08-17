import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/api_service/api_constant.dart';
import 'package:getxdemo/constant/app_string.dart';
import 'package:getxdemo/main.dart';
import 'package:http/http.dart' as http;
import 'package:awesome_top_snackbar/awesome_top_snackbar.dart';

abstract class ApiService {
  static const commonHeader = {
    'username': 'kminchelle',
    'password': '0lelplR',
    // 'Authorization': 'Basic YWRtaW46bXVzRCB3aDE2IDdGTTEgdjgxcSBtbzZJIEUxV2c='
  };

  static Future<dynamic> callGetApi(String endPoint, BuildContext? context, Function? onError) async {
    print("ApiService GET Api: ${endPoint}");
    print("ApiService Api Header: $commonHeader");

    var response = await http.get(Uri.parse(ApiConstant.baseUrl + endPoint), headers: commonHeader);
    // await http.get(Uri.parse(BASE_URL + endPoint), headers: commonHeader);

    print("ApiService GET Response Code : ${response.statusCode}");
    print("ApiService GET Response : ${json.decode(response.body)}");
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      if (onError != null) {
        onError();
      } else {
        openAndCloseLoadingDialog(false);
        awesomeTopSnackbar(Get.context!, msgSomethingWentWrong);
      }
      return null;
    }
  }

  static Future<dynamic> callPostApi(String endPoint, Map<String, String> params, Function? onError) async {
    print("ApiService Post Api: ${endPoint}");
    print("ApiService Api Header: $commonHeader");
    print("ApiService Api Params: ${jsonEncode(params)}");

    var response = await http.post(Uri.parse(ApiConstant.baseUrl + endPoint), headers: commonHeader, body: params);

    print("ApiService Post Response Code : ${response.statusCode}");
    print("ApiService Post Response : ${json.decode(response.body)}");
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      if (onError != null) {
        onError();
      } else {
        openAndCloseLoadingDialog(false);
        awesomeTopSnackbar(Get.context!, msgSomethingWentWrong);
      }
      return null;
    }
  }
}
