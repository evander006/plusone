import 'package:plusone/frontend/data/model/user_auth_model.dart';
import 'package:plusone/frontend/data/model/user_register_model.dart';
import 'package:plusone/frontend/data/repositories/user_repository.dart';
import 'package:plusone/frontend/data/services/user_service.dart';

class UserRepositoryRemote implements UserRepository {
  final UserService _userService;

  new(this._userService);

 
  @override
  Future<String> authUser(UserAuthModel user) async {
    return await _userService.authUser(user);
  }

  @override
  Future<String> registerUser(UserRegisterModel user) async {
    return await _userService.registerUser(user);
  }
 
}