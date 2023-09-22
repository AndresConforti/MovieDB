import 'package:flutter/material.dart';
import '../constants/constants.dart';

class RatingStars extends StatelessWidget {
  const RatingStars({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.star,
          color: Colors.yellow,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow,
        ),
        Icon(
          Icons.star_half,
          color: Colors.yellow,
        ),
        Icon(Icons.star_border),
        Text(
          Constants.ratingNumber,
          style: TextStyle(
            fontSize: Constants.ratingTextSize,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
