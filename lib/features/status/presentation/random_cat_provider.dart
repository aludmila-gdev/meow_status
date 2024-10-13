import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';

import 'package:meow_status/features/status/data/cat_image_repository.dart';
import 'package:meow_status/features/status/domain/fetch_cat_image_usecase.dart';

final catImageProvider =
    StateNotifierProvider<CatImageNotifier, String?>((ref) {
  final repository = FetchCatImageUseCase(CatImageRepository());
  return CatImageNotifier(repository);
});

class CatImageNotifier extends StateNotifier<String?> {
  final FetchCatImageUseCase _useCase;

  CatImageNotifier(this._useCase) : super(null);

  void fetchRandomCat() async {
    final randomStatusCode = Random().nextInt(100) + 100;
    state = await _useCase.execute(randomStatusCode);
  }
}
