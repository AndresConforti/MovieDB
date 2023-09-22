import '../../model/movie_data.dart';

abstract class MovieInterface {
  Future<Movie> getMovieById(int id);
  Future<List<Movie>> getMovies();
}
