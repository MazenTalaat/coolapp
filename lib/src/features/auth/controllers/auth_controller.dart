import 'package:coolapp/src/features/auth/models/auth_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthController extends StateNotifier<AuthStatus> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final mailFormKey = GlobalKey<FormState>();
  final passFormKey = GlobalKey<FormState>();

  AuthController()
      : super(
          const AuthStatus(
            email: '',
            password: '',
            isLoading: false,
            isLoggedIn: false,
            error: '',
            obscurePassword: true,
            isValidEmail: true,
            isValidPassword: true,
          ),
        ) {
    emailController.addListener(() {
      state = state.copyWith(email: emailController.text);
    });
    passwordController.addListener(() {
      state = state.copyWith(password: passwordController.text);
    });
  }

  Future loginUser() async {
    try {
      state = state.copyWith(isLoading: true, error: '');
      Future.delayed(const Duration(seconds: 2), () {
        state = state.copyWith(isLoading: false, isLoggedIn: true);
        Future.delayed(const Duration(seconds: 2), () {
          state = state.copyWith(isLoggedIn: false);
        });
      });
    } catch (e) {
      print(e.toString());
    }
  }

  void togglePassword() {
    state = state.copyWith(obscurePassword: !state.obscurePassword);
  }

  bool isReadyToLogin() {
    mailFormKey.currentState!.validate();
    passFormKey.currentState!.validate();
    var m = state.isValidEmail;
    var p = state.isValidPassword;
    return m && p;
  }

  void validEmail(bool status) {
    state = state.copyWith(isValidEmail: status);
  }

  void validPassword(bool status) {
    state = state.copyWith(isValidPassword: status);
  }
}

final authControllerProvider =
    StateNotifierProvider<AuthController, AuthStatus>((ref) {
  return AuthController();
});
