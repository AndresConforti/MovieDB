import '../../../core/utils/data_state.dart';
import '../../../data/repository/local/genre_repo_local.dart';
import '../../entity/genre_entity.dart';

class GenreUseCase {
  late final GenreRepository genreRepo = GenreRepository();

  Future<DataState<List<Genre>>> getGenres() async {
    try {
      DataState genres = await genreRepo.getGenres();
      List<Genre> movieList = genres.data;
      return DataState(state: DataStateStates.SUCCESS, data: movieList);
    } catch (exception) {
      rethrow;
    }
  }

  Future<DataState<List<String>>> getGenresById(List<int> intList) async {
    try {
      DataState genres = await genreRepo.getGenresById(intList);
      List<String> genreList = genres.data;
      return DataState(state: DataStateStates.SUCCESS, data: genreList);
    } catch (exception) {
      rethrow;
    }
  }
}
