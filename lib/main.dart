import 'package:flutter/material.dart';
import '../screens/movie_list.dart';
import '../screens/movie_details.dart';
import '../utils/routes.dart';

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
        RoutesNames.home: (BuildContext context) => const MovieListScreen(),
        RoutesNames.movieDetails: (BuildContext context) =>
            const DetailScreen(),
      },
    );
  }
}
