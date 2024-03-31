import 'package:getxdemo/pages/login/model/login_response_model.dart';

abstract class AuthRepository {
  Future<LoginResponseModel> doLogin({String username, String password});
}
