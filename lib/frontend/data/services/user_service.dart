import 'package:dio/dio.dart';
import 'package:plusone/frontend/data/model/user_auth_model.dart';
import 'package:plusone/frontend/data/model/user_register_model.dart';

class UserService {
  UserService(this._dio);
  final Dio _dio;

  Future<String> authUser(UserAuthModel user) async {
    final response = await _dio.post(
      "/user/auth",
      data: {"email": user.email, "password": user.password},
    );
    return response.data["access_token"] as String;
  }

  Future<String> registerUser(UserRegisterModel user) async {
    final response = await _dio.post(
      "/user/create",
      data: {
        "email": user.email,
        "display_name": user.displayName,
        "city": user.city,
        "password": user.password,
      },
    );
    return response.data["access_token"] as String;
  }
}
