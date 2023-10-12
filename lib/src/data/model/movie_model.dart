import '../../domain/entity/movie_entity.dart';

class MovieModel extends Movie {
  MovieModel({
    required super.adult,
    required super.backdrop,
    required super.genres,
    required super.id,
    required super.originalLanguage,
    required super.originalTitle,
    required super.overview,
    required super.popularity,
    required super.poster,
    required super.releaseDate,
    required super.title,
    required super.video,
    required super.voteAverage,
    required super.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> moviesJson) {
    return MovieModel(
      adult: moviesJson['adult'] as bool,
      backdrop: moviesJson['backdrop_path'] as String,
      genres: List<int>.from(moviesJson['genre_ids']),
      id: moviesJson['id'] as int,
      originalLanguage: moviesJson['original_language'] as String,
      originalTitle: moviesJson['original_title'] as String,
      overview: moviesJson['overview'] as String,
      popularity: moviesJson['popularity'] as double,
      poster: moviesJson['poster_path'] as String,
      releaseDate: moviesJson['release_date'] as String,
      title: moviesJson['title'] as String,
      video: moviesJson['video'] as bool,
      voteAverage: moviesJson['vote_average'] as num,
      voteCount: moviesJson['vote_count'] as int,
    );
  }
}
