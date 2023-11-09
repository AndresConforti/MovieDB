import 'package:flutter/material.dart';

import './config/route/routes.dart';
import './presentation/view/home_page_view.dart';
import './presentation/view/movie_details_view.dart';
import './presentation/view/movie_list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      initialRoute: RoutesNames.home,
      routes: {
        RoutesNames.home: (BuildContext context) => const HomePage(),
        RoutesNames.movieList: (BuildContext context) =>
            const MovieListScreen(),
        RoutesNames.movieDetails: (BuildContext context) =>
            const DetailScreen(),
      },
    );
  }
}
