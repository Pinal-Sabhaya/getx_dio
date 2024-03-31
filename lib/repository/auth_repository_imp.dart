import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:getxdemo/api_service/api_constant.dart';
import 'package:getxdemo/api_service/dio_client.dart';
import 'package:getxdemo/enums/method_type.dart';
import 'package:getxdemo/pages/login/model/login_response_model.dart';
import 'package:getxdemo/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  late DioClient _dioClient;

  AuthRepositoryImpl() {
    _dioClient = Get.find();
  }

  @override
  Future<LoginResponseModel> doLogin(
      {String? username, String? password}) async {
    try {
      var jsonBody = {
        ApiConstant.paramUsername: username ?? "",
        ApiConstant.paramPassword: password ?? "",
      };
      var response = await _dioClient.request(
          ApiConstant.login, MethodType.post, jsonBody);

      return LoginResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
