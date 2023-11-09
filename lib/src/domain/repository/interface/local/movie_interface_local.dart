import '../../../../core/utils/data_state.dart';
import '../../../entity/movie_entity.dart';

abstract class MovieInterfaceLocal {
  Future<DataState<Movie>> getMovieById(int id);
  Future<DataState<List<Movie>>> getMovies();
}
