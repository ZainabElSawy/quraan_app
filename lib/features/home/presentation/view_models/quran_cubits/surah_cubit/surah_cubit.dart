import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quraan_app/features/home/data/models/quran_models/surah_model/surah_model.dart';

import '../../../../data/repo/quran_repository/quran_repo.dart';

part 'surah_state.dart';

class SurahCubit extends Cubit<SurahState> {
  SurahCubit(this.quranRepo) : super(SurahInitial());
  final QuranRepo quranRepo;
  Future<void> fetchSurah({required int numberOfSurah}) async {
    emit(SurahLoading());
    var result = await quranRepo.fetchSurah(numberOfSurah: numberOfSurah);
    result.fold((failure) {
      emit(SurahFailure(failure.errMessage));
    }, (surah) {
      emit(SurahSuccess(surah));
    });
  }
}
