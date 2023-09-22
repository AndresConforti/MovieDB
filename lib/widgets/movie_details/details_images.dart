import 'package:flutter/material.dart';
import '../../utils/dimens.dart';

class PosterImages extends StatelessWidget {
  final String backdrop;
  final String poster;

  const PosterImages({
    super.key,
    required this.backdrop,
    required this.poster,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          image: NetworkImage(backdrop),
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Dimens.posterDetailYAligment,
            horizontal: Dimens.posterDetailXAligment,
          ),
          child: Container(
            width: Dimens.posterDetailWidth,
            height: Dimens.posterDetailHeight,
            padding: const EdgeInsets.all(Dimens.posterDetailStroke),
            decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.circular(Dimens.posterDetailRadius),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Dimens.posterDetailRadius),
              child: SizedBox.fromSize(
                child: Image.network(
                  poster,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
