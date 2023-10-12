import 'package:flutter/material.dart';
import '../../widget/common/stroked_text.dart';
import '../../../core/utils/dimens.dart';

class DetailHeader extends StatelessWidget {
  final String title;
  final String originalTitle;
  final String releaseDate;

  const DetailHeader({
    super.key,
    required this.title,
    required this.originalTitle,
    required this.releaseDate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.infoPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StrokedText(
            text: title,
            textSize: Dimens.titleTextSize,
            strokeSize: Dimens.titleStroke,
          ),
          Text(
            originalTitle,
            style: const TextStyle(
              fontSize: Dimens.originalTitleSize,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
