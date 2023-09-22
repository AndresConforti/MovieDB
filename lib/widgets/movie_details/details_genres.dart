import 'package:flutter/material.dart';
import '../../repository/genre_repo.dart';
import '../../repository/interface/genre_interface.dart';
import '../../utils/dimens.dart';
import '../../utils/strings.dart';
import './details_genres_card.dart';

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
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            debugPrint(Strings.snapshotError);
            return const Text(Strings.snapshotError);
          } else if (snapshot.hasData) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: Dimens.genresSeparator,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data?.length,
                  itemBuilder: (
                    BuildContext context,
                    int index,
                  ) {
                    return GenresCard(genreName: snapshot.data![index]);
                  }),
            );
          } else {
            debugPrint(Strings.snapshotError);
            return const Text(Strings.snapshotError);
          }
        } else {
          debugPrint(Strings.snapshotOther);
          return const Text(Strings.snapshotOther);
        }
      },
    );
  }
}
