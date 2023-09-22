import 'dart:convert';
import 'package:flutter/services.dart';
import '../model/genre_data.dart';
import '../utils/strings.dart';
import './interface/genre_interface.dart';

class GenreRepository extends GenreInterface {
  List<Genre> parsedGenresList = [];

  Future<List<Genre>> parseGenres() async {
    final jsonPath = await rootBundle.loadString(Strings.jsonGenresLocation);
    var jsonList = jsonDecode(jsonPath);
    return List<dynamic>.from(jsonList["genres"])
        .map((genre) => Genre.fromJson(genre))
        .toList();
  }

  @override
  Future<List<Genre>> getGenres() async {
    if (parsedGenresList.isEmpty) {
      parsedGenresList = await parseGenres();
    }
    return parsedGenresList;
  }

  @override
  Future<List<String>> getGenresById(List<int> genreList) async {
    var genresTest = await parseGenres();
    return genresTest
        .where((genres) => genreList.contains(genres.id))
        .map((genre) => genre.name)
        .toList();
  }
}
