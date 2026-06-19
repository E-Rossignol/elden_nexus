import 'package:firebase_auth/firebase_auth.dart';

/// Simple wrapper around FirebaseAuth to centralize auth calls.
///
/// Use this to get current user and perform sign-in/registration operations.
class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  /// Current signed-in Firebase user or null.
  ///
  /// @return User? current user
  User? get currentUser => _firebaseAuth.currentUser;

  /// Stream of auth state changes.
  ///
  /// @return Stream<User?> auth state stream
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  /// Sign in with email and password.
  ///
  /// @param email The user's email.
  /// @param password The user's password.
  /// @return Future<void>
  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  /// Create a user with email and password.
  ///
  /// @param email The user's email.
  /// @param password The user's password.
  /// @return Future<void>
  Future<void> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  /// Sign in using provided AuthCredential (e.g., OAuth).
  ///
  /// @param credential The credential to sign in with.
  /// @return Future<void>
  Future<void> signInWithCredentials(AuthCredential credential) async {
    await _firebaseAuth.signInWithCredential(credential);
  }

  /// Sign out the current user.
  ///
  /// @return Future<void>
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
