import './movie_model.dart';

class MovieResponseModel {
  final int page;
  final List<MovieModel> results;
  final int maxPages;
  final int maxResults;

  MovieResponseModel({
    required this.page,
    required this.results,
    required this.maxPages,
    required this.maxResults,
  });

  factory MovieResponseModel.fromJson(Map json) {
    return MovieResponseModel(
      page: json["page"],
      results: List.from(json["results"])
          .map(
            (movie) => MovieModel.fromJson(movie),
          )
          .toList(),
      maxPages: json["maxPages"],
      maxResults: json["maxResults"],
    );
  }
}
