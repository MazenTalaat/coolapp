import 'package:coolapp/src/features/auth/models/auth_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthController extends StateNotifier<AuthStatus> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final mailFormKey = GlobalKey<FormState>();
  final passFormKey = GlobalKey<FormState>();
  final user = FirebaseAuth.instance.currentUser!;

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
    if (isReadyToLogin()) {
      try {
        state = state.copyWith(isLoading: true, error: '');
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
          email: state.email,
          password: state.password,
        );
        state = state.copyWith(isLoading: false, isLoggedIn: true, error: user.email!);
      } on FirebaseAuthException catch (e) {
        state = state.copyWith(isLoading: false, isLoggedIn: false);
        if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
          state = state.copyWith(error: 'Email or password is not correct');
          print('Email or password is not correct');
        }
      }
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
