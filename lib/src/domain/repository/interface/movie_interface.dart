import '../../entity/movie_entity.dart';

abstract class MovieInterface {
  Future<Movie> getMovieById(int id);
  Future<List<Movie>> getMovies();
}
