// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RegisterStatus {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isLoggedIn => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;
  bool get obscurePassword => throw _privateConstructorUsedError;
  bool get isValidEmail => throw _privateConstructorUsedError;
  bool get isValidPassword => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterStatusCopyWith<RegisterStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterStatusCopyWith<$Res> {
  factory $RegisterStatusCopyWith(
          RegisterStatus value, $Res Function(RegisterStatus) then) =
      _$RegisterStatusCopyWithImpl<$Res, RegisterStatus>;
  @useResult
  $Res call(
      {String email,
      String password,
      bool isLoading,
      bool isLoggedIn,
      String error,
      bool obscurePassword,
      bool isValidEmail,
      bool isValidPassword});
}

/// @nodoc
class _$RegisterStatusCopyWithImpl<$Res, $Val extends RegisterStatus>
    implements $RegisterStatusCopyWith<$Res> {
  _$RegisterStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? isLoading = null,
    Object? isLoggedIn = null,
    Object? error = null,
    Object? obscurePassword = null,
    Object? isValidEmail = null,
    Object? isValidPassword = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoggedIn: null == isLoggedIn
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      obscurePassword: null == obscurePassword
          ? _value.obscurePassword
          : obscurePassword // ignore: cast_nullable_to_non_nullable
              as bool,
      isValidEmail: null == isValidEmail
          ? _value.isValidEmail
          : isValidEmail // ignore: cast_nullable_to_non_nullable
              as bool,
      isValidPassword: null == isValidPassword
          ? _value.isValidPassword
          : isValidPassword // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterStatusImplCopyWith<$Res>
    implements $RegisterStatusCopyWith<$Res> {
  factory _$$RegisterStatusImplCopyWith(_$RegisterStatusImpl value,
          $Res Function(_$RegisterStatusImpl) then) =
      __$$RegisterStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String password,
      bool isLoading,
      bool isLoggedIn,
      String error,
      bool obscurePassword,
      bool isValidEmail,
      bool isValidPassword});
}

/// @nodoc
class __$$RegisterStatusImplCopyWithImpl<$Res>
    extends _$RegisterStatusCopyWithImpl<$Res, _$RegisterStatusImpl>
    implements _$$RegisterStatusImplCopyWith<$Res> {
  __$$RegisterStatusImplCopyWithImpl(
      _$RegisterStatusImpl _value, $Res Function(_$RegisterStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? isLoading = null,
    Object? isLoggedIn = null,
    Object? error = null,
    Object? obscurePassword = null,
    Object? isValidEmail = null,
    Object? isValidPassword = null,
  }) {
    return _then(_$RegisterStatusImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoggedIn: null == isLoggedIn
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      obscurePassword: null == obscurePassword
          ? _value.obscurePassword
          : obscurePassword // ignore: cast_nullable_to_non_nullable
              as bool,
      isValidEmail: null == isValidEmail
          ? _value.isValidEmail
          : isValidEmail // ignore: cast_nullable_to_non_nullable
              as bool,
      isValidPassword: null == isValidPassword
          ? _value.isValidPassword
          : isValidPassword // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$RegisterStatusImpl implements _RegisterStatus {
  const _$RegisterStatusImpl(
      {required this.email,
      required this.password,
      required this.isLoading,
      required this.isLoggedIn,
      required this.error,
      required this.obscurePassword,
      required this.isValidEmail,
      required this.isValidPassword});

  @override
  final String email;
  @override
  final String password;
  @override
  final bool isLoading;
  @override
  final bool isLoggedIn;
  @override
  final String error;
  @override
  final bool obscurePassword;
  @override
  final bool isValidEmail;
  @override
  final bool isValidPassword;

  @override
  String toString() {
    return 'RegisterStatus(email: $email, password: $password, isLoading: $isLoading, isLoggedIn: $isLoggedIn, error: $error, obscurePassword: $obscurePassword, isValidEmail: $isValidEmail, isValidPassword: $isValidPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterStatusImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoggedIn, isLoggedIn) ||
                other.isLoggedIn == isLoggedIn) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.obscurePassword, obscurePassword) ||
                other.obscurePassword == obscurePassword) &&
            (identical(other.isValidEmail, isValidEmail) ||
                other.isValidEmail == isValidEmail) &&
            (identical(other.isValidPassword, isValidPassword) ||
                other.isValidPassword == isValidPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password, isLoading,
      isLoggedIn, error, obscurePassword, isValidEmail, isValidPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterStatusImplCopyWith<_$RegisterStatusImpl> get copyWith =>
      __$$RegisterStatusImplCopyWithImpl<_$RegisterStatusImpl>(
          this, _$identity);
}

abstract class _RegisterStatus implements RegisterStatus {
  const factory _RegisterStatus(
      {required final String email,
      required final String password,
      required final bool isLoading,
      required final bool isLoggedIn,
      required final String error,
      required final bool obscurePassword,
      required final bool isValidEmail,
      required final bool isValidPassword}) = _$RegisterStatusImpl;

  @override
  String get email;
  @override
  String get password;
  @override
  bool get isLoading;
  @override
  bool get isLoggedIn;
  @override
  String get error;
  @override
  bool get obscurePassword;
  @override
  bool get isValidEmail;
  @override
  bool get isValidPassword;
  @override
  @JsonKey(ignore: true)
  _$$RegisterStatusImplCopyWith<_$RegisterStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
