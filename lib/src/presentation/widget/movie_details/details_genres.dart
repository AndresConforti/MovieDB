import 'package:flutter/material.dart';

import '../../../core/utils/dimens.dart';
import '../../../core/utils/strings.dart';
import '../../../domain/entity/genres_state.dart';
import '../common/snapshot_text.dart';
import 'details_genres_card.dart';

class DetailGenres extends StatelessWidget {
  final Stream<GenreListState> genreStream;

  DetailGenres({
    super.key,
    required this.genreStream,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<GenreListState>(
      stream: genreStream,
      builder: (
        BuildContext context,
        AsyncSnapshot<GenreListState> snapshot,
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
                itemCount: snapshot.data!.data?.length,
                itemBuilder: (
                  BuildContext context,
                  int index,
                ) {
                  return GenresCard(genreName: snapshot.data!.data![index]);
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
