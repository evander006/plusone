// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_register_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserRegisterModel {

 String get email;@JsonKey(name: 'display_name') String get displayName; String get city;@JsonKey(name: 'password_hash') String get password;
/// Create a copy of UserRegisterModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserRegisterModelCopyWith<UserRegisterModel> get copyWith => _$UserRegisterModelCopyWithImpl<UserRegisterModel>(this as UserRegisterModel, _$identity);

  /// Serializes this UserRegisterModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as UserRegisterModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserRegisterModel&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.displayName, _this.displayName) || other.displayName == _this.displayName)&&(identical(other.city, _this.city) || other.city == _this.city)&&(identical(other.password, _this.password) || other.password == _this.password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as UserRegisterModel;
  return Object.hash(runtimeType,_this.email,_this.displayName,_this.city,_this.password);
}

@override
String toString() {
  final _this = this as UserRegisterModel;
  return 'UserRegisterModel(email: ${_this.email}, displayName: ${_this.displayName}, city: ${_this.city}, password: ${_this.password})';
}


}

/// @nodoc
abstract mixin class $UserRegisterModelCopyWith<$Res>  {
  factory $UserRegisterModelCopyWith(UserRegisterModel value, $Res Function(UserRegisterModel) _then) = _$UserRegisterModelCopyWithImpl;
@useResult
$Res call({
 String email,@JsonKey(name: 'display_name') String displayName, String city,@JsonKey(name: 'password_hash') String password
});




}
/// @nodoc
class _$UserRegisterModelCopyWithImpl<$Res>
    implements $UserRegisterModelCopyWith<$Res> {
  _$UserRegisterModelCopyWithImpl(this._self, this._then);

  final UserRegisterModel _self;
  final $Res Function(UserRegisterModel) _then;

/// Create a copy of UserRegisterModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? displayName = null,Object? city = null,Object? password = null,}) {
  return _then(UserRegisterModel(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserRegisterModel].
extension UserRegisterModelPatterns on UserRegisterModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserRegisterModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserRegisterModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserRegisterModel value)  $default,){
final _that = this;
switch (_that) {
case _UserRegisterModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserRegisterModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserRegisterModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email, @JsonKey(name: 'display_name')  String displayName,  String city, @JsonKey(name: 'password_hash')  String password)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserRegisterModel() when $default != null:
return $default(_that.email,_that.displayName,_that.city,_that.password);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email, @JsonKey(name: 'display_name')  String displayName,  String city, @JsonKey(name: 'password_hash')  String password)  $default,) {final _that = this;
switch (_that) {
case _UserRegisterModel():
return $default(_that.email,_that.displayName,_that.city,_that.password);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email, @JsonKey(name: 'display_name')  String displayName,  String city, @JsonKey(name: 'password_hash')  String password)?  $default,) {final _that = this;
switch (_that) {
case _UserRegisterModel() when $default != null:
return $default(_that.email,_that.displayName,_that.city,_that.password);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserRegisterModel implements UserRegisterModel {
  const _UserRegisterModel({required this.email, @JsonKey(name: 'display_name') required this.displayName, required this.city, @JsonKey(name: 'password_hash') required this.password});
  factory _UserRegisterModel.fromJson(Map<String, dynamic> json) => _$UserRegisterModelFromJson(json);

@override final  String email;
@override@JsonKey(name: 'display_name') final  String displayName;
@override final  String city;
@override@JsonKey(name: 'password_hash') final  String password;

/// Create a copy of UserRegisterModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserRegisterModelCopyWith<_UserRegisterModel> get copyWith => __$UserRegisterModelCopyWithImpl<_UserRegisterModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserRegisterModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserRegisterModel&&(identical(other.email, email) || other.email == email)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.city, city) || other.city == city)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,email,displayName,city,password);
}

@override
String toString() {
    return 'UserRegisterModel(email: $email, displayName: $displayName, city: $city, password: $password)';
}


}

/// @nodoc
abstract mixin class _$UserRegisterModelCopyWith<$Res> implements $UserRegisterModelCopyWith<$Res> {
  factory _$UserRegisterModelCopyWith(_UserRegisterModel value, $Res Function(_UserRegisterModel) _then) = __$UserRegisterModelCopyWithImpl;
@override @useResult
$Res call({
 String email,@JsonKey(name: 'display_name') String displayName, String city,@JsonKey(name: 'password_hash') String password
});




}
/// @nodoc
class __$UserRegisterModelCopyWithImpl<$Res>
    implements _$UserRegisterModelCopyWith<$Res> {
  __$UserRegisterModelCopyWithImpl(this._self, this._then);

  final _UserRegisterModel _self;
  final $Res Function(_UserRegisterModel) _then;

/// Create a copy of UserRegisterModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? displayName = null,Object? city = null,Object? password = null,}) {
  return _then(_UserRegisterModel(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
