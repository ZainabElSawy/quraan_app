import 'package:dartz/dartz.dart';
import 'package:quraan_app/core/constants/failure.dart';
import 'package:quraan_app/features/home/data/models/prayer_timings_model/prayer_timings_model.dart';

abstract class PrayerTimingsRepo {
  Future<Either<Failure, PrayerTimingsModel>> fetchPrayerTimings();
}
