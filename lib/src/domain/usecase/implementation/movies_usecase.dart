import 'package:movie_db/src/core/utils/data_state.dart';
import 'package:movie_db/src/data/repository/local/movie_repo_local.dart';

import '../../entity/movie_entity.dart';

class MovieListUseCase {
  late final MovieRepository movieRepo = MovieRepository();

  Future<DataState<List<Movie>>> getMovies() async {
    try {
      DataState movies = await movieRepo.getMovies();
      List<Movie> movieList = movies.data;
      return DataState(state: DataStateStates.SUCCESS, data: movieList);
    } catch (exception) {
      rethrow;
    }
  }
}
