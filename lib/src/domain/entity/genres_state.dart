import 'package:movie_db/src/core/utils/data_state.dart';

class GenreListState {
  final DataStateStates state;
  late final List<String>? _data;
  late final String? _error;

  GenreListState({
    required this.state,
  });

  set error(String value) {
    _error = value;
  }

  set genreList(List<String> value) {
    _data = value;
  }

  List<String>? get data => _data;
}
