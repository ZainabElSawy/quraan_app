// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:quraan_app/features/auth/data/repos/auth_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  AuthRepo authRepo;
  bool loading = false;
  Future<void> signUp({
    required String inpEmail,
    required String inpPassword,
  }) async {
    emit(SignUpLoading());
    var result = await authRepo.signUpRepo(
      email: inpEmail,
      password: inpPassword,
    );
    result.fold(
      (error) => emit(SignUpFailure(error)),
      (credential) => emit(SignUpSuccess()),
    );
  }
}
