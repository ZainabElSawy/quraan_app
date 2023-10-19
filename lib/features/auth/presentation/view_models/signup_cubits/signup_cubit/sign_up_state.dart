part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {
  const SignUpState();

  List<Object> get props => [];
}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpFailure extends SignUpState {
  final String? errMessage;
  const SignUpFailure(this.errMessage);
}

final class SignUpSuccess extends SignUpState {}
