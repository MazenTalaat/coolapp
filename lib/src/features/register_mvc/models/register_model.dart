import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_model.freezed.dart';

@freezed
class RegisterStatus with _$RegisterStatus {
  const factory RegisterStatus({
    required String email,
    required String password,
    required bool isLoading,
    required bool isLoggedIn,
    required String error,
    required bool obscurePassword,
    required bool isValidEmail,
    required bool isValidPassword,
  }) = _RegisterStatus;
}
