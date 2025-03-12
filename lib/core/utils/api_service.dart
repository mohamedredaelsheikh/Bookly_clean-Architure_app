import 'package:bookly/core/utils/constants.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get("$kBaseUrl$endPoint");
    return response.data;
  }
}
