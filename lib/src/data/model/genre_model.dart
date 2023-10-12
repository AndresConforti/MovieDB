import '../../domain/entity/genre_entity.dart';

class GenreModel extends Genre {
  GenreModel({
    required super.id,
    required super.name,
  });

  factory GenreModel.fromJson(Map<String, dynamic> genresJson) {
    return GenreModel(
      id: genresJson['id'] as int,
      name: genresJson['name'] as String,
    );
  }
}
