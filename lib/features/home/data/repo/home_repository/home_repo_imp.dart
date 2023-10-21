import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:quraan_app/core/constants/failure.dart';
import 'package:quraan_app/core/services/api_service.dart';
import 'package:quraan_app/features/home/data/models/prayer_timings_model/prayer_timings_model.dart';

import 'home_repo.dart';

class HomeRepoImp implements HomeRepo {
  ApiService apiService =
      ApiService(dio: Dio(), baseUrl: 'https://api.aladhan.com/v1/');
  HomeRepoImp();

  @override
  Future<Either<Failure, PrayerTimingsModel>> fetchPrayerTimings() async {
    try {
      Map<String, dynamic> data = await apiService.get(
          endPoint:
              'timingsByCity/16-10-2023?city=cairo&country=egypt&method=8');
      PrayerTimingsModel prayerTimingsModel =
          PrayerTimingsModel.fromJson(data['data']);
      return right(prayerTimingsModel);
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
