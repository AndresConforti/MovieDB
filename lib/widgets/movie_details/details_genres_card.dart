import 'package:flutter/material.dart';
import '../../utils/dimens.dart';

class GenresCard extends StatelessWidget {
  final String genreName;

  const GenresCard({
    super.key,
    required this.genreName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.deepOrange,
      margin:
          const EdgeInsetsDirectional.symmetric(horizontal: Dimens.infoPadding),
      shape: const RoundedRectangleBorder(
        side: BorderSide(),
        borderRadius:
            BorderRadius.all(Radius.circular(Dimens.genresCardRadius)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(Dimens.infoPadding),
            child: Text(
              genreName.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
