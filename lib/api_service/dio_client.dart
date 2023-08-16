import 'package:awesome_top_snackbar/awesome_top_snackbar.dart';
import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:getxdemo/api_service/api_interceptor.dart';
import 'package:getxdemo/constant/app_string.dart';
import 'package:getxdemo/enums/method_type.dart';
import 'package:getxdemo/main.dart';
import 'package:getxdemo/routes/apppages.dart';
import 'package:getxdemo/utils/storage_utils.dart';
import 'api_constant.dart';

class DioClient extends GetxService {
  late Dio _dio = Dio(BaseOptions(baseUrl: ApiConstant.baseUrl))..interceptors.add(ApiInterceptors());

  Future<DioClient> init() async {
    _dio = Dio(BaseOptions(baseUrl: ApiConstant.baseUrl))..interceptors.add(ApiInterceptors());
    return this;
  }

  Future<Map<String, dynamic>> request(String url, MethodType method, [dynamic params]) async {
    try {
      Response response;
      if (await checkConnectivity()) {
        if (method == MethodType.post) {
          response = await _dio.post(url, data: params);
        } else if (method == MethodType.delete) {
          response = await _dio.delete(url);
        } else if (method == MethodType.patch) {
          response = await _dio.patch(url);
        } else {
          response = await _dio.get(
            url,
          );
        }

        return response.data;
      } else {
        return {"message": checkInternet, "status": false};
      }
    } on DioException catch (dioError) {
      if (dioError.response?.statusCode == 401) {
        Get.offAllNamed(Routes.splash);
        StorageUtil.clearLoginData();
        awesomeTopSnackbar(Get.context!, sessionExpired);
      }
      return {"message": dioError.response?.data["message"], "status": false};
    } catch (error) {
      return {"message": error.toString(), "status": false};
    }
  }

  Future<Map<String, dynamic>> multipartRequest(String url, MethodType method, dynamic params) async {
    try {
      Response response;
      if (await checkConnectivity()) {
        response = await _dio.post(url,
            data: params,
            options: Options(headers: {
              "Content-Type": "multipart/form-data",
            }));
        return response.data;
      } else {
        return {"message": checkInternet, "status": false};
      }
    } on DioException catch (dioError) {
      if (dioError.response?.statusCode == 401) {
        Get.offAllNamed(Routes.splash);
        StorageUtil.clearLoginData();
        awesomeTopSnackbar(Get.context!, sessionExpired);
      }
      return {"message": dioError.response?.data["message"], "status": false};
    } catch (error) {
      return {"message": error.toString(), "status": false};
    }
  }
}
