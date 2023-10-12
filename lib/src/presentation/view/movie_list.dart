import 'package:flutter/material.dart';
import '../../config/route/routes.dart';
import '../../core/utils/strings.dart';
import '../../data/repository/movie_repo.dart';
import '../../domain/entity/movie_entity.dart';
import '../../domain/repository/interface/movie_interface.dart';
import '../widget/common/snapshot_text.dart';
import '../widget/movie_list/list_card.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  late final Future<List<Movie>> data;
  final MovieInterface movieRepo = MovieRepository();

  @override
  void initState() {
    super.initState();
    data = getUiData();
  }

  Future<List<Movie>> getUiData() async {
    final List<Movie> movies = await movieRepo.getMovies();
    return movies;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: SafeArea(
        child: FutureBuilder<List<Movie>>(
          future: data,
          builder: (
            BuildContext context,
            AsyncSnapshot<List<Movie>> snapshot,
          ) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else
              (snapshot.connectionState == ConnectionState.done);
            {
              if (snapshot.hasError) {
                return SnapshotText(text: Strings.snapshotError);
              } else if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (
                    BuildContext context,
                    int index,
                  ) {
                    final payload = snapshot.data![index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RoutesNames.movieDetails,
                          arguments: payload,
                        );
                      },
                      child: ListCard(
                        posterUrl: payload.posterUrl,
                        title: payload.title,
                      ),
                    );
                  },
                );
              } else if (!snapshot.hasData) {
                return SnapshotText(text: Strings.snapshotEmpty);
              } else {
                return SnapshotText(text: Strings.snapshotOther);
              }
            }
          },
        ),
      ),
    );
  }
}
