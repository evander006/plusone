// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserRegisterModel _$UserRegisterModelFromJson(Map<String, dynamic> json) =>
    _UserRegisterModel(
      email: json['email'] as String,
      displayName: json['display_name'] as String,
      city: json['city'] as String,
      password: json['password_hash'] as String,
    );

Map<String, dynamic> _$UserRegisterModelToJson(_UserRegisterModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'display_name': instance.displayName,
      'city': instance.city,
      'password_hash': instance.password,
    };
