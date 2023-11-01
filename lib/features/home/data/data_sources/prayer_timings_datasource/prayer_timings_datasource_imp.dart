// prayer_timings_remote_datasource.dart
import '../../../../../core/services/api_service.dart';
import 'prayer_timings_datasource.dart';

class PrayerTimingsDataSourceImp implements PrayerTimingsDataSource {
  final ApiService apiService;

  PrayerTimingsDataSourceImp(this.apiService);

  @override
  Future<Map<String, dynamic>> fetchPrayerTimingsData() async {
    try {
      return await apiService.get(
          endPoint:
              'timingsByCity/16-10-2023?city=cairo&country=egypt&method=8');
    } catch (e) {
      rethrow;
    }
  }
}
