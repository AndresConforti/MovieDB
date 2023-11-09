import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_db/src/presentation/widget/common/stroked_text.dart';

import '../../config/route/routes.dart';
import '../../core/utils/strings.dart';
import '../../domain/entity/movies_state.dart';
import '../bloc/movie_list_bloc.dart';
import '../widget/common/snapshot_text.dart';
import '../widget/movie_list/list_posters.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  final MovieListBloc movieBloc = MovieListBloc();
  late final Stream<MovieListState> movieStream = movieBloc.dataStream;

  @override
  void initState() {
    super.initState();
    movieBloc.getMovies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.orange),
        backgroundColor: Colors.black,
        title: Text(
          "THE MOVIE DB",
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: Center(
          child: StrokedText(text: "test drawer", textSize: 20, strokeSize: 5),
        ),
      ),
      backgroundColor: Colors.black54,
      body: SafeArea(
        child: PageView(
          physics: BouncingScrollPhysics(),
          children: [
            StreamBuilder<MovieListState>(
              stream: movieStream,
              builder: (
                BuildContext context,
                AsyncSnapshot<MovieListState> snapshot,
              ) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else
                  (snapshot.connectionState == ConnectionState.done);
                {
                  if (snapshot.hasError) {
                    return SnapshotText(text: Strings.snapshotError);
                  } else if (snapshot.hasData) {
                    return GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 19 / 30,
                        mainAxisSpacing: 25,
                        crossAxisSpacing: 10,
                      ),
                      itemCount: snapshot.data!.data?.length,
                      itemBuilder: (
                        BuildContext context,
                        int index,
                      ) {
                        final payload = snapshot.data!.data?[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RoutesNames.movieDetails,
                              arguments: payload,
                            );
                          },
                          child: ListPosters(
                            posterUrl: payload!.posterUrl,
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
            Center(
                child:
                    StrokedText(text: "PAGE 2", textSize: 20, strokeSize: 5)),
            Center(
                child:
                    StrokedText(text: "PAGE 3", textSize: 20, strokeSize: 5)),
          ],
        ),
      ),
    );
  }
}
