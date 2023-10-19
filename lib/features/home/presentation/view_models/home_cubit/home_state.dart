part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class FavouritState extends HomeState {}

final class QuranState extends HomeState {}

final class CompassState extends HomeState {}

final class PrayersState extends HomeState {}
