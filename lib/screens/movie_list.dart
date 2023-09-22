import 'package:flutter/material.dart';
import '../utils/routes.dart';
import '../widgets/movie_list/list_card.dart';
import '../utils/strings.dart';
import '../../repository/interface/movie_interface.dart';
import '../../repository/movie_repo.dart';
import '../model/movie_data.dart';

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
    List<Movie> movies = await movieRepo.getMovies();
    return movies;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      body: SafeArea(
        child: FutureBuilder<List<Movie>>(
          future: data,
          builder: (
            BuildContext context,
            AsyncSnapshot<List<Movie>> snapshot,
          ) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return const Text(Strings.snapshotError);
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
              } else {
                return const Text(Strings.snapshotError);
              }
            } else {
              return const Text(Strings.snapshotOther);
            }
          },
        ),
      ),
    );
  }
}
