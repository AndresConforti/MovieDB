import 'dart:convert';
import 'package:flutter/services.dart';
import '../../data/model/movie_model.dart';
import '../../core/utils/strings.dart';
import '../../domain/entity/movie_entity.dart';
import '../../domain/repository/interface/movie_interface.dart';

class MovieRepository extends MovieInterface {
  List<Movie> parsedMovieList = [];

  Future<List<Movie>> _parseMovies() async {
    final jsonPath = await rootBundle.loadString(Strings.jsonMoviesLocation);
    return List.from(
      jsonDecode(jsonPath).map((movie) => MovieModel.fromJson(movie)),
    );
  }

  @override
  Future<Movie> getMovieById(int id) async {
    if (parsedMovieList.isEmpty) {
      parsedMovieList = await _parseMovies();
    }
    return parsedMovieList.where((element) => element.id == id).first;
  }

  @override
  Future<List<Movie>> getMovies() async {
    if (parsedMovieList.isEmpty) {
      parsedMovieList = await _parseMovies();
    }
    return parsedMovieList;
  }
}
