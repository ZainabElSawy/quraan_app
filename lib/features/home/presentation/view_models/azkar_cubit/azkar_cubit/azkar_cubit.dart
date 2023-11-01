import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quraan_app/features/home/data/repo/azkar_repository/azkar_repo.dart';

import '../../../../data/models/azkar_model/azkar_model.dart';

part 'azkar_state.dart';

class AzkarCubit extends Cubit<AzkarState> {
  final AzkarRepo azkarRepo;
  AzkarCubit(this.azkarRepo) : super(AzkarInitial());
  Future<void> fetchAzkar() async {
    emit(AzkarLoading());
    var result = await azkarRepo.fetchAzkar();
    result.fold((failure) {
      emit(AzkarFailure(failure.errMessage));
    }, (azkar) {
      emit(AzkarSuccess(azkar));
    });
  }
}
