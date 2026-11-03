// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String,
  email: json['email'] as String,
  displayName: json['displayName'] as String,
  city: json['city'] as String,
  passwordHash: json['passwordHash'] as String,
  createdAt: json['createdAt'] as String,
  events:
      (json['events'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'displayName': instance.displayName,
      'city': instance.city,
      'passwordHash': instance.passwordHash,
      'createdAt': instance.createdAt,
      'events': instance.events,
    };
