part of 'player_timings_cubit.dart';

sealed class PlayerTimingsState extends Equatable {
  const PlayerTimingsState();

  @override
  List<Object> get props => [];
}

final class PlayerTimingsInitial extends PlayerTimingsState {}

final class PrayerTimingsLoading extends PlayerTimingsState {}

final class PrayerTimingsFailure extends PlayerTimingsState {
  final String errMessage;
  const PrayerTimingsFailure(this.errMessage);
}

final class PrayerTimingsSuccess extends PlayerTimingsState {
  final PrayerTimingsModel prayerTimingsModel;
  const PrayerTimingsSuccess(this.prayerTimingsModel);
}
