import 'package:movie_db/src/core/utils/data_state.dart';

import 'movie_entity.dart';

class MovieListState {
  final DataStateStates state;
  late final List<Movie>? _data;
  late final String? _error;

  MovieListState({
    required this.state,
  });

  set error(String value) {
    _error = value;
  }

  set movieList(List<Movie> value) {
    _data = value;
  }

  List<Movie>? get data => _data;
}
