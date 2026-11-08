import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:plusone/frontend/data/model/user_auth_model.dart';
import 'package:plusone/frontend/data/model/user_register_model.dart';
import 'package:plusone/frontend/data/repositories/user_repository.dart';

class AuthViewModel extends ChangeNotifier {
  final UserRepository _userRepository;

  String? _errorMessage;
  bool _loading = false;
  String? _accessToken;

  bool get loading => _loading;
  String? get errorMessage => _errorMessage;

  AuthViewModel({required UserRepository userRepository})
    : _userRepository = userRepository;

  UserRepository get authRepository => _userRepository;
  String? get accessToken => _accessToken;

  Future<bool> authUser(UserAuthModel user) async {
    return await _executeAuth(() => _userRepository.authUser(user));
  }

  Future<bool> registerUser(UserRegisterModel user) async {
    return await _executeAuth(() => _userRepository.registerUser(user));
  }

  Future<bool> _executeAuth(Future<String> Function() request) async {
    _loading = true;
    _errorMessage = null;
    notifyListeners();
    try {
      _accessToken = await request();
      return true;
    } on DioException catch (e) {
      _errorMessage = switch (e.response?.statusCode) {
        401 => 'Неверный email или пароль',
        409 => 'Пользователь с таким email уже зарегистрирован',
        422 => 'Некорректные данные',
        _ => _messageFromResponse(e) ?? 'Ошибка соединения с сервером',
      };
      return false;
    } catch (e) {
      _errorMessage = 'Не удалось выполнить запрос';
      return false;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  String? _messageFromResponse(DioException e) {
    final data = e.response?.data;
    if (data is Map && data['message'] != null) {
      return data['message'].toString();
    }
    return null;
  }
}
