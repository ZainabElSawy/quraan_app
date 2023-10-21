import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:quraan_app/core/constants/failure.dart';
import 'package:quraan_app/core/services/api_service.dart';
import 'package:quraan_app/features/home/data/models/quran_models/sur_model/sur_model.dart';
import '../../models/quran_models/surah_model/surah_model.dart';
import 'quran_repo.dart';

class QuranRepoImp implements QuranRepo {
  ApiService apiService =
      ApiService(dio: Dio(), baseUrl: 'http://api.alquran.cloud/v1/');

  @override
  Future<Either<Failure, List<SurModel>>> fetchSur() async {
    try {
      Map<String, dynamic> data = await apiService.get(endPoint: 'surah');
      List<SurModel> sur = [];
      for (var surah in data['data']) {
        sur.add(SurModel.fromJson(surah));
      }
      return right(sur);
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SurahModel>> fetchSurah(
      {required int numberOfSurah}) async {
    try {
      Map<String, dynamic> data =
          await apiService.get(endPoint: 'surah/$numberOfSurah');
      SurahModel surah = SurahModel.fromJson(data['data']);
      return right(surah);
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
