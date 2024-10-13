import 'package:dio/dio.dart';

class CatImageRepository {
  final Dio _dio = Dio();

  Future<String> fetchCatImage(int statusCode) async {
    final response = await _dio.get('https://http.cat/$statusCode');
    return response.realUri.toString();
  }
}
