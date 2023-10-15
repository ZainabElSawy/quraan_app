import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCheckBoxCubit extends Cubit<bool> {
  CustomCheckBoxCubit(bool initialState) : super(initialState);

  void toggleValue() {
    emit(!state);
  }
}
