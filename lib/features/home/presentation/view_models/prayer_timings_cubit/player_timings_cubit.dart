import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quraan_app/features/home/data/models/prayer_timings_model/prayer_timings_model.dart';

import '../../../data/repo/prayer_timings_repository/prayer_timings_repo.dart';

part 'player_timings_state.dart';

class PlayerTimingsCubit extends Cubit<PlayerTimingsState> {
  PlayerTimingsCubit(this.prayerTimingsRepo) : super(PlayerTimingsInitial());
  final PrayerTimingsRepo prayerTimingsRepo;
  Future<void> fetchPrayerTimings() async {
    emit(PrayerTimingsLoading());
    var result = await prayerTimingsRepo.fetchPrayerTimings();
    result.fold((failure) {
      emit(PrayerTimingsFailure(failure.errMessage));
    }, (prayerTimings) {
      emit(PrayerTimingsSuccess(prayerTimings));
    });
  }
}
