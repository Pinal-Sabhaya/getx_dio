import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart' as get_x;
import 'package:getxdemo/constant/storage_key_constants.dart';
import 'package:getxdemo/utils/logger_util.dart';
import 'package:getxdemo/utils/storage_utils.dart';

import 'api_constant.dart';

class ApiInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final method = options.method;
    final uri = options.uri;
    final data = options.data;


    String? token = await StorageUtil.getData(StorageKeyConstants.cKeyToken);
    logger.e("TOKEN == $token");
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = "Bearer $token";
    }

  /*  options.headers[ApiConstant.xApiKey] = ApiConstant.xApiValue;
    options.headers['Accept'] = 'application/json';
    if (method == 'GET') {
      logger
          .e("✈️ REQUEST[$method] => PATH: $uri \n Token: ${options.headers}");
    } else {
      try {
        logger.e(
            "✈️ REQUEST[$method] => PATH: $uri \n Token:${options.headers} \n DATA: ${jsonEncode(data)}");
      } catch (e) {
        logger.e(
            "✈️ REQUEST[$method] => PATH: $uri \n Token: ${options.headers} \n DATA: ${data.files.toString()}");
      }
    }
    super.onRequest(options, handler);*/

    options.headers['KEY'] = ApiConstant.value;
    options.headers['Accept'] = 'application/json';
    if (method == 'GET') {
      logger
          .e("✈️ REQUEST[$method] => PATH: $uri \n Token: ${options.headers}");
    } else {
      try {
        logger.e(
            "✈️ REQUEST[$method] => PATH: $uri \n Token:${options.headers} \n DATA: ${jsonEncode(data)}");
      } catch (e) {
        logger.e(
            "✈️ REQUEST[$method] => PATH: $uri \n Token: ${options.headers} \n DATA: ${data.files.toString()}");
      }
    }
    super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    final statusCode = response.statusCode;
    final uri = response.requestOptions.uri;
    final data = jsonEncode(response.data);
    logger.e("✅ RESPONSE[$statusCode] => PATH: $uri\n DATA: $data");

    //handle error state
    if (response.data["code"] == 0) {
      EasyLoading.dismiss();
      if ((get_x.Get.isDialogOpen != null && get_x.Get.isDialogOpen == true) ||
          (get_x.Get.isBottomSheetOpen != null &&
              get_x.Get.isBottomSheetOpen == true)) {
        Navigator.of(get_x.Get.overlayContext!).pop();
      }

    } else {
      super.onResponse(response, handler);
    }
    //Handle section expired
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    final statusCode = err.response?.statusCode!;
    final uri = err.requestOptions.path;
    var data = "";

    if (EasyLoading.isShow) {
      EasyLoading.dismiss();
    }

    try {
      data = jsonEncode(err.response!.data);
    } catch (e) {
      logger.log(e.toString());
    }
    logger.log("ERROR[$statusCode] => PATH: $uri\n DATA: $data",
        printFullText: true);
    super.onError(err, handler);
  }
}
