import '../../core/utils/strings.dart';

class Movie {
  final bool adult;
  final String backdrop;
  final List<int> genres;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String poster;
  final String releaseDate;
  final String title;
  final bool video;
  final num voteAverage;
  final int voteCount;

  Movie({
    required this.adult,
    required this.backdrop,
    required this.genres,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.poster,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  String get backdropUrl => '${Strings.baseUrl}$backdrop';
  String get posterUrl => '${Strings.baseUrl}$poster';
}
