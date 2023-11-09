import '../../../../core/utils/data_state.dart';
import '../../../entity/genre_entity.dart';

abstract class GenreInterfaceLocal {
  Future<DataState<List<Genre>>> getGenres();
  Future<DataState<List<String>>> getGenresById(List<int> genreList);
}
