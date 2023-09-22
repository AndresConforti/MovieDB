import 'package:flutter/material.dart';
import './constants/constants.dart';
import './widgets/movie_header.dart';
import './widgets/like_button.dart';
import './widgets/poster_images.dart';
import './widgets/rating_stars.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
      ),
      home: const MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: ListView(
          children: const [
            Center(
              child: PosterImages(),
            ),
            Column(
              children: [
                MovieHeader(),
                RatingStars(),
                Padding(
                  padding: EdgeInsets.all(Constants.descriptionPaddingSize),
                  child: Text(
                    Constants.overview,
                    style: TextStyle(
                      fontSize: Constants.descriptionTextSize,
                      color: Colors.black,
                    ),
                  ),
                ),
                Center(
                  child: LikeButton(),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
