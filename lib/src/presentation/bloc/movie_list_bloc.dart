import 'dart:async';

import '../../core/bloc/i_bloc.dart';
import '../../core/utils/data_state.dart';
import '../../core/utils/strings.dart';
import '../../domain/entity/movie_entity.dart';
import '../../domain/entity/movies_state.dart';
import '../../domain/usecase/implementation/movies_usecase.dart';

class MovieListBloc extends IBloc {
  late final StreamController<MovieListState> streamController;
  late final MovieListUseCase movieListUseCase = MovieListUseCase();

  MovieListBloc() {
    streamController = StreamController.broadcast();
  }

  Stream<MovieListState> get dataStream => streamController.stream;

  @override
  Future<void> initialize() async {}

  Future<void> getMovies() async {
    DataState<List<Movie>> moviesListDataState;
    moviesListDataState = await movieListUseCase.getMovies();

    MovieListState movieListState = MovieListState(
      state: moviesListDataState.state,
    );
    switch (movieListState.state) {
      case DataStateStates.SUCCESS:
        movieListState.movieList = moviesListDataState.data!;
        break;
      case DataStateStates.ERROR:
        movieListState.error =
            '${Strings.stateSuccess}${moviesListDataState.error}';
        break;
      default:
        movieListState.error = Strings.stateError;
    }
    streamController.sink.add(movieListState);
  }

  @override
  void dispose() {
    streamController.close();
  }
}
