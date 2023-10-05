// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(LoginState());
  void showLogin() => emit(LoginState());
  void showSignUp() => emit(SignupState());
}
