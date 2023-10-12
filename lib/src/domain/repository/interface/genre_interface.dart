import '../../entity/genre_entity.dart';

abstract class GenreInterface {
  Future<List<Genre>> getGenres();
  Future<List<String>> getGenresById(List<int> genreList);
}
