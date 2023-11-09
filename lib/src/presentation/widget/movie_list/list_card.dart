import 'package:flutter/material.dart';

import '../../../core/utils/dimens.dart';
import '../common/stroked_text.dart';

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(3),
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
