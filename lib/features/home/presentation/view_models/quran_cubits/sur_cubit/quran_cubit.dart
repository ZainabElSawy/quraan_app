import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quraan_app/features/home/data/models/quran_models/sur_model/sur_model.dart';
import 'package:quraan_app/features/home/data/repo/quran_repository/quran_repo.dart';

part 'quran_state.dart';

class SurCubit extends Cubit<SurState> {
  SurCubit(this.quranRepo) : super(SurInitial());
  final QuranRepo quranRepo;
  Future<void> fetchSur() async {
    emit(SurLoading());
    var result = await quranRepo.fetchSur();
    result.fold((failure) {
      emit(SurFailure(failure.errMessage));
    }, (sur) {
      emit(SurSuccess(sur));
    });
  }
}
