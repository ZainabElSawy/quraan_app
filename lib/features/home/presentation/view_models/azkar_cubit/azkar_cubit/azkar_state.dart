part of 'azkar_cubit.dart';

sealed class AzkarState extends Equatable {
  const AzkarState();

  @override
  List<Object> get props => [];
}

final class AzkarInitial extends AzkarState {}

final class AzkarLoading extends AzkarState {}

final class AzkarFailure extends AzkarState {
  final String errMessage;
  const AzkarFailure(this.errMessage);
}

final class AzkarSuccess extends AzkarState {
  final List<AzkarModel> azkarList;
  const AzkarSuccess(this.azkarList);
}
