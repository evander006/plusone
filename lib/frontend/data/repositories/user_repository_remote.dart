import 'package:plusone/frontend/data/model/user_auth_model.dart';
import 'package:plusone/frontend/data/model/user_model.dart';
import 'package:plusone/frontend/data/repositories/user_repository.dart';
import 'package:plusone/frontend/data/services/user_service.dart';

class AuthRepositoryRemote implements UserRepository {
  final UserService _userService;

  new(this._userService);

 
  @override
  Future<void> authUser(UserAuthModel user)async {
    _userService.authUser(user);
  }

  @override
  Future<void> registerUser(UserModel user) async{
    _userService.registerUser(user);
  }
 
}