import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quraan_app/core/constants/failure.dart';
import 'package:quraan_app/features/home/data/data_sources/prayer_timings_datasource/prayer_timings_datasource.dart';
import 'package:quraan_app/features/home/data/models/prayer_timings_model/prayer_timings_model.dart';

import 'prayer_timings_repo.dart';

class PrayerTimingsRepoImp implements PrayerTimingsRepo {
  final PrayerTimingsDataSource dataSource;
  PrayerTimingsRepoImp(this.dataSource);
  @override
  Future<Either<Failure, PrayerTimingsModel>> fetchPrayerTimings() async {
    try {
      Map<String, dynamic> data = await dataSource.fetchPrayerTimingsData();
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
