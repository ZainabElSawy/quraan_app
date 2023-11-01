abstract class QuranDataSource {
  Future<Map<String, dynamic>> getSurData();
  Future<Map<String, dynamic>> getSurahData({required int numberOfSurah});
}
