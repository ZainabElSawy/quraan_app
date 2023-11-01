import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quraan_app/core/constants/failure.dart';
import 'package:quraan_app/features/home/data/data_sources/Azkar_datasource/azkar_datasource.dart';
import 'package:quraan_app/features/home/data/models/azkar_model/azkar_details_model.dart';
import 'package:quraan_app/features/home/data/models/azkar_model/azkar_model.dart';
import 'package:quraan_app/features/home/data/repo/azkar_repository/azkar_repo.dart';

class AzkarRepoImp extends AzkarRepo {
  final AzkarDataSource dataSource;
  AzkarRepoImp(this.dataSource);
  @override
  Future<Either<Failure, List<AzkarModel>>> fetchAzkar() async {
    List<AzkarModel> azkarList = [];
    try {
      List<dynamic> data = await dataSource.fetchAzkarData();
      for (var element in data) {
        azkarList.add(AzkarModel.fromJson(element));
      }
      return right(azkarList);
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<AzkarDetailsModel>>> fetchAzkarDetails({
    required int id,
  }) async {
    List<AzkarDetailsModel> azkarDetailsList = [];
    try {
      List<dynamic> data = await dataSource.fetchAzkarDetailsData();
      for (var element in data) {
        AzkarDetailsModel.fromJson(element).sectionId == id
            ? azkarDetailsList.add(AzkarDetailsModel.fromJson(element))
            : null;
      }
      return right(azkarDetailsList);
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
