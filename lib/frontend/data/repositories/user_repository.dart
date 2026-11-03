import 'package:plusone/frontend/data/model/user_auth_model.dart';
import 'package:plusone/frontend/data/model/user_model.dart';

abstract class UserRepository {
  Future<void> authUser(UserAuthModel user);
  Future<void> registerUser(UserModel user);
}
