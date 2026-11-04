// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserRegisterModel _$UserRegisterModelFromJson(Map<String, dynamic> json) =>
    _UserRegisterModel(
      email: json['email'] as String,
      displayName: json['displayName'] as String,
      city: json['city'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$UserRegisterModelToJson(_UserRegisterModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'displayName': instance.displayName,
      'city': instance.city,
      'password': instance.password,
    };
