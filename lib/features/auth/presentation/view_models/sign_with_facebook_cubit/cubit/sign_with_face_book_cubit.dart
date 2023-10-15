import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:quraan_app/features/auth/data/repos/auth_repo.dart';

part 'sign_with_face_book_state.dart';

class SignWithFaceBookCubit extends Cubit<SignWithFaceBookState> {
  SignWithFaceBookCubit(this.authRepo) : super(SignWithFaceBookInitial());
  AuthRepo authRepo;
  Future<void> signFacebook() async {
    emit(SignWithFacebookLoading());
    var result = await authRepo.signWithFaceBook();
    result.fold(
      (error) => emit(SignWithFacebookFailure(error)),
      (credential) => emit(SignWithFacebookSuccess(credential)),
    );
  }
}
