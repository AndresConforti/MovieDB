import 'package:flutter/material.dart';
import '../../../data/repository/genre_repo.dart';
import '../../../domain/repository/interface/genre_interface.dart';
import '../../../core/utils/dimens.dart';
import '../../../core/utils/strings.dart';
import '../common/snapshot_text.dart';
import 'details_genres_card.dart';

class DetailGenres extends StatelessWidget {
  final List<int> genres;
  final GenreInterface genreRepo = GenreRepository();

  DetailGenres({
    super.key,
    required this.genres,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: genreRepo.getGenresById(genres),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<String>> snapshot,
      ) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else
          (snapshot.connectionState == ConnectionState.done);
        {
          if (snapshot.hasError) {
            return SnapshotText(text: Strings.snapshotError);
          } else if (snapshot.hasData) {
            return SizedBox(
              height: Dimens.genresSeparator,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data?.length,
                itemBuilder: (
                  BuildContext context,
                  int index,
                ) {
                  return GenresCard(genreName: snapshot.data![index]);
                },
              ),
            );
          } else if (!snapshot.hasData) {
            return SnapshotText(text: Strings.snapshotEmpty);
          } else {
            return SnapshotText(text: Strings.snapshotOther);
          }
        }
      },
    );
  }
}
