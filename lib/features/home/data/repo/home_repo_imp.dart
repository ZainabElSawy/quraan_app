import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:quraan_app/core/constants/failure.dart';
import 'package:quraan_app/core/services/api_service.dart';
import 'package:quraan_app/features/home/data/models/prayer_timings_model/prayer_timings_model.dart';
import 'package:quraan_app/features/home/data/repo/home_repo.dart';

class HomeRepoImp implements HomeRepo {
  ApiService apiService;
  HomeRepoImp(this.apiService);

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
        //print("** Error **:${e.message}");
        return left(ServerFailure.fromDioError(e));
      }
      //print("*** Error ***:$e");
      return left(ServerFailure(e.toString()));
    }
  }
  // @override
  // Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
  //   try {
  //     Map<String, dynamic> data = await apiService.get(
  //         endPoint:
  //             'volumes?Filtering=free-ebooks&Sorting=newest&q=computer science');
  //     List<BookModel> books = [];
  //     for (var book in data['items']) {
  //       books.add(BookModel.fromJson(book));
  //     }
  //     return right(books);
  //   } catch (e) {
  //     // ignore: deprecated_member_use
  //     if (e is DioError) {
  //       return left(ServerFailure.fromDioError(e));
  //     }
  //     return left(ServerFailure(e.toString()));
  //   }
  // }
}
