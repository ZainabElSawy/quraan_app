import 'package:dio/dio.dart';

class ApiService {
  ApiService({required this.dio, required this.baseUrl});
  final String baseUrl;
  final Dio dio;
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    Response reponse = await dio.get("$baseUrl$endPoint");
    return reponse.data;
  }
}
