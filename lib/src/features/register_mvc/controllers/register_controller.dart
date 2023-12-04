import 'package:coolapp/core/locator.dart';
import 'package:coolapp/src/features/register_mvc/models/register_model.dart';
import 'package:coolapp/src/features/register_mvc/repositories/register_firebase.dart';
import 'package:coolapp/src/features/register_mvc/repositories/register_local.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController extends StateNotifier<RegisterStatus> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final mailFormKey = GlobalKey<FormState>();
  final passFormKey = GlobalKey<FormState>();

  var registerLocator = locator.get<RegisterFirebase>();
  // var registerLocator = locator.get<RegisterLocal>();
  final SharedPreferences prefs = locator.get<SharedPreferences>();

  RegisterController()
      : super(
    const RegisterStatus(
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

  Future registerUser() async {
    if (isReadyToRegister()) {
      try {
        state = state.copyWith(isLoading: true, error: '');
        await registerLocator.registerUser(state.email, state.password);
        await prefs.setBool('loggedIn', true);
        await prefs.setString('email', state.email);
        await prefs.setString('loginType', 'firebaseUser');
        state = state.copyWith(isLoading: false, isLoggedIn: true);
      } on FirebaseAuthException catch (e) {
        state = state.copyWith(isLoading: false, isLoggedIn: false, error: e.code);
      }
      state = state.copyWith(isLoading: false);
    }
  }

  String getFromSharedPreference() {
    final bool? logged = prefs.getBool('loggedIn');
    final String? email = prefs.getString('email');
    final String? loginType = prefs.getString('loginType');

    return 'isLogged? $logged, email: $email, loginType: $loginType';
  }

  void togglePassword() {
    state = state.copyWith(obscurePassword: !state.obscurePassword);
  }

  bool isReadyToRegister() {
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

final registerControllerProvider =
StateNotifierProvider.autoDispose<RegisterController, RegisterStatus>((ref) {
  return RegisterController();
});
