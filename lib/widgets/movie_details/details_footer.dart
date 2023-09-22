import 'package:flutter/material.dart';
import '../../utils/dimens.dart';
import '../../utils/strings.dart';

class DetailFooter extends StatelessWidget {
  final String releaseDate;
  final String overview;

  const DetailFooter({
    super.key,
    required this.releaseDate,
    required this.overview,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: Dimens.releaseDatePadding),
      child: Column(
        children: [
          const SizedBox(height: Dimens.footerSeparator),
          Text(
            '${Strings.releaseText}$releaseDate',
            style: const TextStyle(
              fontSize: Dimens.releaseDateSize,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: Dimens.likesSpacing),
          Text(
            overview,
            style: const TextStyle(
              fontSize: Dimens.defaultTextSize,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
