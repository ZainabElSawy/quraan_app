import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:quraan_app/core/constants/failure.dart';
import 'package:quraan_app/features/home/data/models/quran_models/sur_model/sur_model.dart';
import 'package:quraan_app/features/home/data/models/quran_models/surah_model/surah_model.dart';

import '../../data_sources/quran_datasource/quran_datasource.dart';
import 'quran_repo.dart';

class QuranRepoImpl implements QuranRepo {
  final QuranDataSource dataSource;

  QuranRepoImpl(this.dataSource);

  @override
  Future<Either<Failure, List<SurModel>>> fetchSur() async {
    try {
      final data = await dataSource.getSurData();
      final sur = data['data']
          .map<SurModel>((surah) => SurModel.fromJson(surah))
          .toList();
      return Right(sur);
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SurahModel>> fetchSurah(
      {required int numberOfSurah}) async {
    try {
      final data = await dataSource.getSurahData(numberOfSurah: numberOfSurah);
      final surah = SurahModel.fromJson(data['data']);
      return Right(surah);
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
