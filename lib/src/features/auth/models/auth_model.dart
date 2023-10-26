import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_model.freezed.dart';

@freezed
class AuthStatus with _$AuthStatus {
  const factory AuthStatus({
    required String email,
    required String password,
    required bool isLoading,
    required bool isLoggedIn,
    required String error,
    required bool obscurePassword,
    required bool isValidEmail,
    required bool isValidPassword,
  }) = _AuthStatus;
}
