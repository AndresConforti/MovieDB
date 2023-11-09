import 'dart:async';

import '../../core/bloc/i_bloc.dart';
import '../../core/utils/data_state.dart';
import '../../core/utils/strings.dart';
import '../../domain/entity/genres_state.dart';
import '../../domain/usecase/implementation/genres_usecase.dart';

class MovieDetailsBloc extends IBloc {
  late final StreamController<GenreListState> streamController;
  late final GenreUseCase genreListUseCase = GenreUseCase();

  MovieDetailsBloc() {
    streamController = StreamController.broadcast();
  }

  Stream<GenreListState> get dataStream => streamController.stream;

  @override
  Future<void> initialize() async {}

  Future<void> getGenresById(List<int> genresIntList) async {
    DataState<List<String>> GenresListDataState;
    GenresListDataState = await genreListUseCase.getGenresById(genresIntList);

    GenreListState genreListState = GenreListState(
      state: GenresListDataState.state,
    );
    switch (genreListState.state) {
      case DataStateStates.SUCCESS:
        genreListState.genreList = GenresListDataState.data!;
        break;
      case DataStateStates.ERROR:
        genreListState.error =
            '${Strings.stateSuccess}${GenresListDataState.error}';
        break;
      default:
        genreListState.error = Strings.stateError;
    }
    streamController.sink.add(genreListState);
  }

  @override
  void dispose() {
    streamController.close();
  }
}
