import '../../model/genre_data.dart';

abstract class GenreInterface {
  Future<List<Genre>> getGenres();
  Future<List<String>> getGenresById(List<int> genreList);
}
