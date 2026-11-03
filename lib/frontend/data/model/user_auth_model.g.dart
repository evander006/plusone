// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserAuthModel _$UserAuthModelFromJson(Map<String, dynamic> json) =>
    _UserAuthModel(
      email: json['email'] as String,
      passwordHash: json['passwordHash'] as String,
    );

Map<String, dynamic> _$UserAuthModelToJson(_UserAuthModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'passwordHash': instance.passwordHash,
    };
