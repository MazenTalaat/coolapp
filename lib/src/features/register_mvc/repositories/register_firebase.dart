import 'package:coolapp/src/features/register_mvc/repositories/register_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterFirebase implements RegisterRepository{
  @override
  Future registerUser(email, password) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

}