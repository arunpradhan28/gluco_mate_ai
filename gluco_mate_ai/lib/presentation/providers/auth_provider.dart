import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// Provide FirebaseAuth instance
final authProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

// Track user authentication state
final authStateProvider = StreamProvider<User?>(
  (ref) => ref.watch(authProvider).authStateChanges(),
);

// Auth controller
final authControllerProvider = Provider<AuthController>(
  (ref) => AuthController(ref),
);

class AuthController {
  final Ref ref;
  AuthController(this.ref);

  FirebaseAuth get _auth => ref.read(authProvider);

  Future<void> signInWithEmail(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> registerWithEmail(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signInWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();
    final googleAuth = await googleUser?.authentication;

    if (googleUser != null && googleAuth != null) {
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _auth.signInWithCredential(credential);
    }
  }

  Future<void> logout() async => await _auth.signOut();
}
