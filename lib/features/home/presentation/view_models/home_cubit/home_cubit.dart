// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  void showHome() => emit(HomeInitial());
  void showFavourit() => emit(FavouritState());
  void showQuran() => emit(QuranState());
  void showCompass() => emit(CompassState());
  void showPrayers() => emit(PrayersState());
}
