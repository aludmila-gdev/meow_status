import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/cat_image_repository.dart';
import 'dart:math';

// Lista de códigos de status válidos para http.cat
final List<int> validStatusCodes = [
  100,
  101,
  200,
  201,
  202,
  204,
  301,
  302,
  400,
  401,
  403,
  404,
  500
];

// Provider responsável por gerenciar o estado da imagem do gato
final catImageProvider =
    StateNotifierProvider<CatImageNotifier, String?>((ref) {
  final repository = CatImageRepository();
  return CatImageNotifier(repository);
});

class CatImageNotifier extends StateNotifier<String?> {
  final CatImageRepository _repository;

  CatImageNotifier(this._repository) : super(null);

  void fetchRandomCat() async {
    // Gera um status code aleatório da lista de códigos válidos
    final randomStatusCode =
        validStatusCodes[Random().nextInt(validStatusCodes.length)];
    state = await _repository.fetchCatImage(randomStatusCode);
  }
}
