import 'package:plusone/frontend/data/model/user_model.dart';

class AuthRepository {
  // Placeholder until real auth data source is wired.
}

class AuthViewModel {
  AuthViewModel({required AuthRepository authRepository})
      : _authRepository = authRepository;

  final AuthRepository _authRepository;

  UserModel? _user;
  UserModel? get user => _user;

  AuthRepository get authRepository => _authRepository;
}
