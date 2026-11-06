import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_register_model.freezed.dart';
part 'user_register_model.g.dart';

@freezed
abstract class UserRegisterModel with _$UserRegisterModel {
  const factory UserRegisterModel({
    required String email,
    @JsonKey(name: 'display_name') required String displayName,
    required String city,
    @JsonKey(name: 'password_hash') required String password,
  }) = _UserRegisterModel;

  factory UserRegisterModel.fromJson(Map<String, dynamic> json) =>
      _$UserRegisterModelFromJson(json);
}
