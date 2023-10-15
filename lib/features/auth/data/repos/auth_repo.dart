import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo {
  Future<Either<String, UserCredential>> signUpRepo({
    required String email,
    required String password,
  });
  Future<Either<String, UserCredential>> loginRepo({
    required String email,
    required String password,
  });
  Future<Either<String, UserCredential>> signWithFaceBook();
}
