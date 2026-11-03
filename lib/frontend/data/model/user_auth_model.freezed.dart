// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_auth_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserAuthModel {

 String get email; String get passwordHash;
/// Create a copy of UserAuthModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserAuthModelCopyWith<UserAuthModel> get copyWith => _$UserAuthModelCopyWithImpl<UserAuthModel>(this as UserAuthModel, _$identity);

  /// Serializes this UserAuthModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as UserAuthModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserAuthModel&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.passwordHash, _this.passwordHash) || other.passwordHash == _this.passwordHash));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as UserAuthModel;
  return Object.hash(runtimeType,_this.email,_this.passwordHash);
}

@override
String toString() {
  final _this = this as UserAuthModel;
  return 'UserAuthModel(email: ${_this.email}, passwordHash: ${_this.passwordHash})';
}


}

/// @nodoc
abstract mixin class $UserAuthModelCopyWith<$Res>  {
  factory $UserAuthModelCopyWith(UserAuthModel value, $Res Function(UserAuthModel) _then) = _$UserAuthModelCopyWithImpl;
@useResult
$Res call({
 String email, String passwordHash
});




}
/// @nodoc
class _$UserAuthModelCopyWithImpl<$Res>
    implements $UserAuthModelCopyWith<$Res> {
  _$UserAuthModelCopyWithImpl(this._self, this._then);

  final UserAuthModel _self;
  final $Res Function(UserAuthModel) _then;

/// Create a copy of UserAuthModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? passwordHash = null,}) {
  return _then(UserAuthModel(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,passwordHash: null == passwordHash ? _self.passwordHash : passwordHash // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserAuthModel].
extension UserAuthModelPatterns on UserAuthModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserAuthModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserAuthModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserAuthModel value)  $default,){
final _that = this;
switch (_that) {
case _UserAuthModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserAuthModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserAuthModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email,  String passwordHash)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserAuthModel() when $default != null:
return $default(_that.email,_that.passwordHash);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email,  String passwordHash)  $default,) {final _that = this;
switch (_that) {
case _UserAuthModel():
return $default(_that.email,_that.passwordHash);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email,  String passwordHash)?  $default,) {final _that = this;
switch (_that) {
case _UserAuthModel() when $default != null:
return $default(_that.email,_that.passwordHash);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserAuthModel implements UserAuthModel {
  const _UserAuthModel({required this.email, required this.passwordHash});
  factory _UserAuthModel.fromJson(Map<String, dynamic> json) => _$UserAuthModelFromJson(json);

@override final  String email;
@override final  String passwordHash;

/// Create a copy of UserAuthModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserAuthModelCopyWith<_UserAuthModel> get copyWith => __$UserAuthModelCopyWithImpl<_UserAuthModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserAuthModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserAuthModel&&(identical(other.email, email) || other.email == email)&&(identical(other.passwordHash, passwordHash) || other.passwordHash == passwordHash));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,email,passwordHash);
}

@override
String toString() {
    return 'UserAuthModel(email: $email, passwordHash: $passwordHash)';
}


}

/// @nodoc
abstract mixin class _$UserAuthModelCopyWith<$Res> implements $UserAuthModelCopyWith<$Res> {
  factory _$UserAuthModelCopyWith(_UserAuthModel value, $Res Function(_UserAuthModel) _then) = __$UserAuthModelCopyWithImpl;
@override @useResult
$Res call({
 String email, String passwordHash
});




}
/// @nodoc
class __$UserAuthModelCopyWithImpl<$Res>
    implements _$UserAuthModelCopyWith<$Res> {
  __$UserAuthModelCopyWithImpl(this._self, this._then);

  final _UserAuthModel _self;
  final $Res Function(_UserAuthModel) _then;

/// Create a copy of UserAuthModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? passwordHash = null,}) {
  return _then(_UserAuthModel(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,passwordHash: null == passwordHash ? _self.passwordHash : passwordHash // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
