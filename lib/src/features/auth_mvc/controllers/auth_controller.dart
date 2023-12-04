import 'package:coolapp/core/locator.dart';
import 'package:coolapp/src/features/auth_mvc/models/auth_model.dart';
import 'package:coolapp/src/features/auth_mvc/repositories/auth_local.dart';
import 'package:coolapp/src/features/auth_mvc/repositories/auth_firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends StateNotifier<AuthStatus> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final mailFormKey = GlobalKey<FormState>();
  final passFormKey = GlobalKey<FormState>();

  var authLocator = locator.get<AuthFirebase>();
  // var authLocator = locator.get<AuthLocal>();
  final SharedPreferences prefs = locator.get<SharedPreferences>();

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

  isLogged() {
    final bool? logged = prefs.getBool('loggedIn');
    state = state.copyWith(isLoggedIn: logged ?? false);
    return logged?? false;
  }

  Future loginUser() async {
    if (isReadyToLogin()) {
      try {
        state = state.copyWith(isLoading: true, error: '');
        await authLocator.loginUser(state.email, state.password);
        state = state.copyWith(isLoading: false, isLoggedIn: true);
        await prefs.setBool('loggedIn', true);
        await prefs.setString('email', state.email);
        await prefs.setString('loginType', 'firebaseUser');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
          state = state.copyWith(error: 'Email or password is not correct');
          print('Email or password is not correct');
        }
        state = state.copyWith(isLoading: false, isLoggedIn: false, error: e.code);
      }
      state = state.copyWith(isLoading: false);
    }
  }

  signInWithGoogle() async {
    try {
      state = state.copyWith(isLoading: true, error: '');
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
      if (gUser != null) {
        await authLocator.signInWithGoogle(gUser);
        await prefs.setBool('loggedIn', true);
        await prefs.setString('email', gUser.email);
        await prefs.setString('loginType', 'googleUser');
        state = state.copyWith(isLoading: false, isLoggedIn: true);
      } else {
        state = state.copyWith(isLoading: false, error: 'No user selected');
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  String getFromSharedPreference() {
    final bool? logged = prefs.getBool('loggedIn');
    final String? email = prefs.getString('email');
    final String? loginType = prefs.getString('loginType');

    return 'isLogged? $logged, email: $email, loginType: $loginType';
  }

  void signOut() async {
    state = state.copyWith(isLoading: true, error: '');
    await authLocator.signOut();
    state = state.copyWith(
        isLoading: false, isLoggedIn: false, error: 'signed Out');
    await prefs.setBool('loggedIn', false);
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
    StateNotifierProvider.autoDispose<AuthController, AuthStatus>((ref) {
  return AuthController();
});
