import 'package:flutter/material.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import '../../../core/utils/dimens.dart';

class RatingStars extends StatelessWidget {
  final num voteAverage;

  const RatingStars({
    super.key,
    required this.voteAverage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.infoPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RatingBar.readOnly(
            isHalfAllowed: true,
            alignment: Alignment.center,
            filledIcon: Icons.star,
            emptyIcon: Icons.star_border,
            emptyColor: Colors.white,
            filledColor: Colors.amberAccent,
            halfFilledColor: Colors.amberAccent,
            halfFilledIcon: Icons.star_half,
            initialRating: voteAverage.roundToDouble() / Dimens.divideByHalf,
            maxRating: Dimens.maxRating,
          ),
          Padding(
            padding: const EdgeInsets.all(Dimens.infoPadding),
            child: Text(
              voteAverage.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: Dimens.ratingTextSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
