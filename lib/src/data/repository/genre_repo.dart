import 'dart:convert';
import 'package:flutter/services.dart';
import '../../data/model/genre_model.dart';
import '../../domain/entity/genre_entity.dart';
import '../../core/utils/strings.dart';
import '../../domain/repository/interface/genre_interface.dart';

class GenreRepository extends GenreInterface {
  List<Genre> parsedGenresList = [];

  Future<List<Genre>> _parseGenres() async {
    final jsonPath = await rootBundle.loadString(Strings.jsonGenresLocation);
    return List.from(
      jsonDecode(jsonPath)["genres"].map((genre) => GenreModel.fromJson(genre)),
    );
  }

  @override
  Future<List<Genre>> getGenres() async {
    if (parsedGenresList.isEmpty) {
      parsedGenresList = await _parseGenres();
    }
    return parsedGenresList;
  }

  @override
  Future<List<String>> getGenresById(List<int> genreList) async {
    var genresTest = await _parseGenres();
    return genresTest
        .where((genres) => genreList.contains(genres.id))
        .map((genre) => genre.name)
        .toList();
  }
}
