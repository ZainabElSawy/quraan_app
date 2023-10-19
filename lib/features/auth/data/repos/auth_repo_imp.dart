import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:quraan_app/features/auth/data/repos/auth_repo.dart';
import 'package:quraan_app/main.dart';

class AuthRepoImp extends AuthRepo {
  @override
  Future<Either<String, UserCredential>> signUpRepo({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      sharedPreferences?.setString("uid", credential.user!.uid);
      return right(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return left('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return left('The account already exists for that email.');
      }
    } catch (e) {
      return left("Error: $e");
    }
    return left("");
  }

  @override
  Future<Either<String, UserCredential>> signWithFaceBook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
      sharedPreferences?.setString("uid", userCredential.user!.uid);
      return right(userCredential);
    } catch (e) {
      return left("Error: $e");
    }
  }

  @override
  Future<Either<String, UserCredential>> loginRepo({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      sharedPreferences?.setString("uid", credential.user!.uid);
      return right(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        return left('Email or password is incorrect, please try again !');
      } else {
        return left(e.code);
      }
    } catch (e) {
      return left("Error : $e");
    }
  }
}
