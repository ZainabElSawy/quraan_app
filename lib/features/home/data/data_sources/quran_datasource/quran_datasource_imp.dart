import 'package:quraan_app/core/services/api_service.dart';
import 'package:quraan_app/features/home/data/data_sources/quran_datasource/quran_datasource.dart';

class QuranDataSourceImp extends QuranDataSource {
  final ApiService _apiService;

  QuranDataSourceImp(this._apiService);

  @override
  Future<Map<String, dynamic>> getSurData() async {
    try {
      final data = await _apiService.get(endPoint: 'surah');
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> getSurahData(
      {required int numberOfSurah}) async {
    try {
      final data = await _apiService.get(endPoint: 'surah/$numberOfSurah');
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
