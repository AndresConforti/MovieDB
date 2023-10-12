import 'package:flutter/material.dart';
import '../../core/utils/dimens.dart';
import '../../domain/entity/movie_entity.dart';
import '../widget/movie_details/details_footer.dart';
import '../widget/movie_details/details_genres.dart';
import '../widget/movie_details/details_likes.dart';
import '../widget/movie_details/details_header.dart';
import '../widget/movie_details/details_images.dart';
import '../widget/movie_details/details_rating.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<StatefulWidget> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final payload = ModalRoute.of(context)!.settings.arguments! as Movie;
    return Scaffold(
      backgroundColor: Colors.black54,
      body: SafeArea(
        child: ListView(
          children: [
            Center(
              child: PosterImages(
                backdrop: payload.backdropUrl,
                poster: payload.posterUrl,
              ),
            ),
            Column(
              children: [
                DetailHeader(
                  title: payload.title,
                  releaseDate: payload.releaseDate,
                  originalTitle: payload.originalTitle,
                ),
                RatingStars(voteAverage: payload.voteAverage),
                DetailGenres(genres: payload.genres),
                DetailFooter(
                  releaseDate: payload.releaseDate,
                  overview: payload.overview,
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: Dimens.likesSpacing),
              child: LikeButton(),
            ),
          ],
        ),
      ),
    );
  }
}
