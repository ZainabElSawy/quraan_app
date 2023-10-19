import 'package:dio/dio.dart';
//https://api.aladhan.com/v1/timingsByCity/16-10-2023?city=cairo&country=egypt&method=8
class ApiService {
  ApiService(this._dio);
  final _baseUrl = 'https://api.aladhan.com/v1/';
  final Dio _dio;
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    Response reponse = await _dio.get("$_baseUrl$endPoint");
    return reponse.data;
  }
}
