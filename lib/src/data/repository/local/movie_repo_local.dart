import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../core/utils/data_state.dart';
import '../../../core/utils/strings.dart';
import '../../../domain/entity/movie_entity.dart';
import '../../../domain/repository/interface/local/movie_interface_local.dart';
import '../../model/movie_model.dart';

class MovieRepository extends MovieInterfaceLocal {
  List<Movie> parsedMovieList = [];

  Future<List<Movie>> _parseMovies() async {
    final jsonPath = await rootBundle.loadString(Strings.jsonMoviesLocation);
    return List.from(
      jsonDecode(jsonPath).map((movie) => MovieModel.fromJson(movie)),
    );
  }

  @override
  Future<DataState<Movie>> getMovieById(int id) async {
    if (parsedMovieList.isEmpty) {
      parsedMovieList = await _parseMovies();
    }
    return DataState(
      state: DataStateStates.SUCCESS,
      data: parsedMovieList.where((element) => element.id == id).first,
    );
  }

  @override
  Future<DataState<List<Movie>>> getMovies() async {
    if (parsedMovieList.isEmpty) {
      parsedMovieList = await _parseMovies();
    }
    return DataState(state: DataStateStates.SUCCESS, data: parsedMovieList);
  }
}
