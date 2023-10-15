import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quraan_app/features/auth/data/repos/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  AuthRepo authRepo;
  Future<void> login({
    required String inpEmail,
    required String inpPassword,
  }) async {
    emit(LoginLoading());
    Either<String, UserCredential> result = await authRepo.loginRepo(
      email: inpEmail,
      password: inpPassword,
    );
    result.fold(
      (error) => emit(LoginFailure(error)),
      (credential) => emit(LoginSuccess(credential)),
    );
  }
}
