import 'dart:convert';
import 'package:flutter/services.dart';
import '../utils/strings.dart';
import '../model/movie_data.dart';
import './interface/movie_interface.dart';

class MovieRepository extends MovieInterface {
  List<Movie> parsedMovieList = [];

  Future<List<Movie>> parseMovies() async {
    final jsonPath = await rootBundle.loadString(Strings.jsonMoviesLocation);
    return List.from(
        jsonDecode(jsonPath).map((element) => Movie.fromJson(element)));
  }

  @override
  Future<Movie> getMovieById(id) async {
    if (parsedMovieList.isEmpty) {
      parsedMovieList = await parseMovies();
    }
    return parsedMovieList.where((element) => element.id == id).first;
  }

  @override
  Future<List<Movie>> getMovies() async {
    if (parsedMovieList.isEmpty) {
      parsedMovieList = await parseMovies();
    }
    return parsedMovieList;
  }
}
