import 'package:flutter/material.dart';
import '../../utils/dimens.dart';
import '../common/stroked_text.dart';
import './list_posters.dart';

class ListCard extends StatelessWidget {
  final String posterUrl;
  final String title;

  const ListCard({
    super.key,
    required this.posterUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.deepOrange,
      margin: const EdgeInsets.all(Dimens.cardMargin),
      shape: const RoundedRectangleBorder(
        side: BorderSide(),
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(Dimens.cardRadiusTop),
            topLeft: Radius.circular(Dimens.cardRadiusTop),
            bottomLeft: Radius.circular(Dimens.cardRadiusBottom),
            bottomRight: Radius.circular(Dimens.cardRadiusBottom)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListPosters(poster: posterUrl),
          Padding(
            padding: const EdgeInsets.all(Dimens.infoPadding),
            child: StrokedText(
              text: title,
              textSize: Dimens.titleTextSize,
              strokeSize: Dimens.titleStroke,
            ),
          ),
        ],
      ),
    );
  }
}
