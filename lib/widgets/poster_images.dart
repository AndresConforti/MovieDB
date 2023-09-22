import 'package:flutter/material.dart';
import '../constants/constants.dart';

class PosterImages extends StatelessWidget {
  const PosterImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const Image(
        image: AssetImage(Constants.backdropLocation),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Constants.posterYAligment,
          horizontal: Constants.posterXAligment,
        ),
        child: Container(
          width: Constants.posterWidth,
          height: Constants.posterHeight,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: Constants.posterStroke,
            ),
          ),
          child: const Image(
            fit: BoxFit.fill,
            image: AssetImage(Constants.posterLocation),
          ),
        ),
      ),
    ]);
  }
}
