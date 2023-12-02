abstract class AuthRepository {
  Future loginUser(email, password);

  Future<void> signInWithGoogle(gUser);

  Future<void> signOut();
}
