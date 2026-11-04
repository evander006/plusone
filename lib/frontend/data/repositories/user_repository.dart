import 'package:plusone/frontend/data/model/user_auth_model.dart';
import 'package:plusone/frontend/data/model/user_register_model.dart';

abstract class UserRepository {
  Future<String> authUser(UserAuthModel user);
  Future<String> registerUser(UserRegisterModel user);
}
