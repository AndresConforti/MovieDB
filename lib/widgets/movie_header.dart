import 'package:flutter/material.dart';
import '../constants/constants.dart';

class MovieHeader extends StatelessWidget {
  const MovieHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(Constants.infoPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: <Widget>[
                  Text(
                    Constants.movieTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Constants.titleTextSize,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = Constants.titleStroke
                        ..color = Colors.black,
                    ),
                  ),
                  const Text(
                    Constants.movieTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Constants.titleTextSize,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: Constants.boxSize,
              ),
              const Text(
                Constants.releaseDate,
                style: TextStyle(
                  fontSize: Constants.smallTextSize,
                  color: Colors.black,
                ),
              ),
              const Text(
                Constants.genres,
                style: TextStyle(
                  fontSize: Constants.smallTextSize,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
