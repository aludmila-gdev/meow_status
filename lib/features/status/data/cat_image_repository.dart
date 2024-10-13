import 'package:dio/dio.dart';

class CatImageRepository {
  final Dio _dio = Dio(BaseOptions(
    validateStatus: (status) {
      // Aceita qualquer código de status
      return true;
    },
  ));

  Future<String> fetchCatImage(int statusCode) async {
    try {
      final response = await _dio.get('https://http.cat/$statusCode');

      // Verifica se o código de status é 200
      if (response.statusCode == 200) {
        return response.realUri.toString(); // Retorna a URL da imagem
      } else {
        // Retorna a URL da imagem para erro 404 ou qualquer outro status
        return 'https://http.cat/404';
      }
    } catch (e) {
      // Caso ocorra um erro, retorna uma imagem de erro padrão
      return 'https://http.cat/404';
    }
  }
}
