part of 'sign_with_face_book_cubit.dart';

@immutable
sealed class SignWithFaceBookState {}

final class SignWithFaceBookInitial extends SignWithFaceBookState {}

final class SignWithFacebookLoading extends SignWithFaceBookState {}

final class SignWithFacebookFailure extends SignWithFaceBookState {
  final String? errMessage;
  SignWithFacebookFailure(this.errMessage);
}

final class SignWithFacebookSuccess extends SignWithFaceBookState {
  final UserCredential userCredential;
  SignWithFacebookSuccess(this.userCredential);
}
