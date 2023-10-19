import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quraan_app/features/home/data/models/prayer_timings_model/prayer_timings_model.dart';
import 'package:quraan_app/features/home/data/repo/home_repo.dart';

part 'player_timings_state.dart';

class PlayerTimingsCubit extends Cubit<PlayerTimingsState> {
  PlayerTimingsCubit(this.homeRepo) : super(PlayerTimingsInitial());
  final HomeRepo homeRepo;
  Future<void> fetchPrayerTimings() async {
    emit(PrayerTimingsLoading());
    var result = await homeRepo.fetchPrayerTimings();
    result.fold((failure) {
      emit(PrayerTimingsFailure(failure.errMessage));
    }, (prayerTimings) {
      emit(PrayerTimingsSuccess(prayerTimings));
    });
  }
}
