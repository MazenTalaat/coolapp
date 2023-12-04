import 'package:coolapp/src/features/auth_mvc/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthLocal implements AuthRepository {
  @override
  Future<void> loginUser(email, password) async {
    if (email != 'b@b.com' || password != "123456") {
      throw FirebaseAuthException(code: 'INVALID_LOGIN_CREDENTIALS');
    }
  }

  @override
  Future<void> signInWithGoogle(gUser) async {
    // Do nothing
  }

  @override
  Future<void> signOut() async {
    // Do nothing
  }
}
