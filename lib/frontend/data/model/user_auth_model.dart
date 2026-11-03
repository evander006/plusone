import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_auth_model.freezed.dart';
part 'user_auth_model.g.dart';

@freezed
abstract class UserAuthModel with _$UserAuthModel {
  const factory UserAuthModel({
    required String email,
    required String passwordHash,
  }) = _UserAuthModel;

  factory UserAuthModel.fromJson(Map<String, dynamic> json) =>
      _$UserAuthModelFromJson(json);
}
