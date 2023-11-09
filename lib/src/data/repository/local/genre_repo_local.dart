import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../core/utils/data_state.dart';
import '../../../core/utils/strings.dart';
import '../../../domain/entity/genre_entity.dart';
import '../../../domain/repository/interface/local/genre_interface_local.dart';
import '../../model/genre_model.dart';

class GenreRepository extends GenreInterfaceLocal {
  List<Genre> parsedGenresList = [];

  Future<List<Genre>> _parseGenres() async {
    final jsonPath = await rootBundle.loadString(Strings.jsonGenresLocation);
    return List.from(
      jsonDecode(jsonPath)["genres"].map((genre) => GenreModel.fromJson(genre)),
    );
  }

  @override
  Future<DataState<List<Genre>>> getGenres() async {
    if (parsedGenresList.isEmpty) {
      parsedGenresList = await _parseGenres();
    }
    return DataState(state: DataStateStates.SUCCESS, data: parsedGenresList);
  }

  @override
  Future<DataState<List<String>>> getGenresById(List<int> genreList) async {
    var parsedGenres = await _parseGenres();
    return DataState(
      state: DataStateStates.SUCCESS,
      data: parsedGenres
          .where((genres) => genreList.contains(genres.id))
          .map((genre) => genre.name)
          .toList(),
    );
  }
}
