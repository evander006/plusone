import 'package:dio/dio.dart';
import 'package:plusone/frontend/data/model/user_auth_model.dart';
import 'package:plusone/frontend/data/model/user_model.dart';

class UserService {
  UserService(this._dio);
  final Dio _dio;

  Future<void> authUser(UserAuthModel user) async {
    await _dio.post("/user/auth", data: {
      "email":user.email,
      "password_hash":user.passwordHash
    });
  }

  Future<void> registerUser(UserModel user) async {
    await _dio.post("/user/create", );
  }
}
