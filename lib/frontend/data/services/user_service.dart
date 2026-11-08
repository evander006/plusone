import 'package:dio/dio.dart';
import 'package:plusone/frontend/data/model/user_auth_model.dart';
import 'package:plusone/frontend/data/model/user_register_model.dart';

class UserService {
  UserService(this._dio);
  final Dio _dio;

  Future<String> authUser(UserAuthModel user) async {
    final response = await _dio.post('/user/auth', data: user.toJson());
    return _tokenOrThrow(response);
  }

  Future<String> registerUser(UserRegisterModel user) async {
    final response = await _dio.post('/user/create', data: user.toJson());
    return _tokenOrThrow(response);
  }

  String _tokenOrThrow(Response<dynamic> response) {
    final status = response.statusCode ?? 0;
    if (status >= 200 && status < 300) {
      return response.data['access_token'] as String;
    }
    throw DioException(
      requestOptions: response.requestOptions,
      response: response,
      type: DioExceptionType.badResponse,
    );
  }
}
