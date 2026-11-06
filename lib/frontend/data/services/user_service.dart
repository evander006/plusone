import 'package:dio/dio.dart';
import 'package:plusone/frontend/data/model/user_auth_model.dart';
import 'package:plusone/frontend/data/model/user_register_model.dart';

class UserService {
  UserService(this._dio);
  final Dio _dio;

  Future<String> authUser(UserAuthModel user) async {
    final response = await _dio.post(
      "/user/auth",
      data: user.toJson(),
    );
    return response.data["access_token"] as String;
  }

  Future<String> registerUser(UserRegisterModel user) async {
    final response = await _dio.post(
      "/user/create",
      data:user.toJson(),
    );
    return response.data["access_token"] as String;
  }
}
