import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'auth_datasource.dart';

class AuthDataSourceImp extends AuthDataSource {
  @override
  Future<UserCredential> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential credential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserCredential> signWithFaceBook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      UserCredential credential = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
      return credential;
    } catch (e) {
      rethrow;
    }
  }
}
