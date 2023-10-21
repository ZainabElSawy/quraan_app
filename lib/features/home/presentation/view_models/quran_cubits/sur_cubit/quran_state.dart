part of 'quran_cubit.dart';

sealed class SurState extends Equatable {
  const SurState();

  @override
  List<Object> get props => [];
}

final class SurInitial extends SurState {}

final class SurLoading extends SurState {}

final class SurFailure extends SurState {
  final String errMessage;
  const SurFailure(this.errMessage);
}

final class SurSuccess extends SurState {
  final List<SurModel> surList;
  const SurSuccess(this.surList);
}
