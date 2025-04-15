import '../data/cat_image_repository.dart';

class FetchCatImageUseCase {
  final CatImageRepository repository;

  FetchCatImageUseCase(this.repository);

  Future<String> execute(int statusCode) {
    return repository.fetchCatImage(statusCode);
  }
}
