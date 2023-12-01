import 'package:coolapp/src/features/auth_mvc/models/auth_model.dart';
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

  var firebaseUser;

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

  void isLogged() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? logged = prefs.getBool('loggedIn');
    state = state.copyWith(isLoggedIn: logged??false);
  }

  Future loginUser() async {
    if (isReadyToLogin()) {
      try {
        state = state.copyWith(isLoading: true, error: '');
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: state.email,
          password: state.password,
        );
        firebaseUser = FirebaseAuth.instance.currentUser!;
        state = state.copyWith(
            isLoading: false, isLoggedIn: true, error: firebaseUser.email!);
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('loggedIn', true);
        await prefs.setString('email', state.email);
        await prefs.setString('loginType', 'firebaseUser');

      } on FirebaseAuthException catch (e) {
        state = state.copyWith(isLoading: false, isLoggedIn: false);
        if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
          state = state.copyWith(error: 'Email or password is not correct');
          print('Email or password is not correct');
        }
      }
    }
  }

  signInWithGoogle() async {
    try {
      state = state.copyWith(isLoading: true, error: '');
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
      if (gUser != null) {
        final GoogleSignInAuthentication gAuth = await gUser!.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: gAuth.accessToken,
          idToken: gAuth.idToken,
        );

        await FirebaseAuth.instance.signInWithCredential(credential);
        firebaseUser = FirebaseAuth.instance.currentUser!;
        state = state.copyWith(
            isLoading: false, isLoggedIn: true, error: gUser.displayName!);

        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('loggedIn', true);
        await prefs.setString('email', state.email);
        await prefs.setString('loginType', 'googleUser');
      } else {
        state = state.copyWith(isLoading: false, error: 'No user selected');
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void signOut() async {
    state = state.copyWith(isLoading: true, error: '');
    await FirebaseAuth.instance.signOut();
    GoogleSignIn().signOut();
    state = state.copyWith(
        isLoading: false, isLoggedIn: false, error: 'signed Out');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
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
    StateNotifierProvider<AuthController, AuthStatus>((ref) {
  return AuthController();
});
