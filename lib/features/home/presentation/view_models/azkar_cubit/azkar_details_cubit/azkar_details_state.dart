part of 'azkar_details_cubit.dart';

sealed class AzkarDetailsState extends Equatable {
  const AzkarDetailsState();

  @override
  List<Object> get props => [];
}

final class AzkarDetailsInitial extends AzkarDetailsState {}

final class AzkarDetailsLoading extends AzkarDetailsState {}

final class AzkarDetailsFailure extends AzkarDetailsState {
  final String errMessage;
  const AzkarDetailsFailure(this.errMessage);
}

final class AzkarDetailsSuccess extends AzkarDetailsState {
  final List<AzkarDetailsModel> azkarDetailsList;
  const AzkarDetailsSuccess(this.azkarDetailsList);
}
