import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

class AuthServices {
  AuthServices._();
  static final AuthServices instance = AuthServices._();

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<User?> register({required String email, required String psw}) async {
    User? user;

    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: email, password: psw);
      user = credential.user;
    } catch (e) {
      Logger().e("EXCEPTION: ${e.toString()}");
    }
    return user;
  }

  Future<User?> signIn({required String email, required String psw}) async {
    User? user;

    try {
      UserCredential credential =
          await auth.signInWithEmailAndPassword(email: email, password: psw);
      user = credential.user;
    } catch (e) {
      Logger().e("EXCEPTION: ${e.toString()}");
    }
    return user;
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await auth.signInWithCredential(credential);
    } catch (e) {
      Logger().d("EXCEPTION: ${e.toString()}");
    }
  }

  Future<void> logOut() async {
    await auth.signOut();
    await GoogleSignIn().signOut();
  }
}
