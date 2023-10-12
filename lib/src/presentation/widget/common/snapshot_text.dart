import 'package:flutter/material.dart';
import '../../../core/utils/dimens.dart';

class SnapshotText extends StatelessWidget {
  final String text;

  const SnapshotText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text.toUpperCase(),
        maxLines: Dimens.titleStrokeMaxLines,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: Dimens.defaultTextSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
