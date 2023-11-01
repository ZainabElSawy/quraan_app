import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/models/azkar_model/azkar_details_model.dart';
import '../../../../data/repo/azkar_repository/azkar_repo.dart';

part 'azkar_details_state.dart';

class AzkarDetailsCubit extends Cubit<AzkarDetailsState> {
  AzkarDetailsCubit(this.azkarRepo) : super(AzkarDetailsInitial());
  final AzkarRepo azkarRepo;
  Future<void> fetchAzkarDetails({required int id}) async {
    emit(AzkarDetailsLoading());
    var result = await azkarRepo.fetchAzkarDetails(id: id);
    result.fold((failure) {
      emit(AzkarDetailsFailure(failure.errMessage));
    }, (azkarDetails) {
      emit(AzkarDetailsSuccess(azkarDetails));
    });
  }
  
}
