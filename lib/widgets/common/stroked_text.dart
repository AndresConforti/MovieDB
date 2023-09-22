import 'package:flutter/material.dart';
import '../../utils/dimens.dart';

class StrokedText extends StatelessWidget {
  final String text;
  final double textSize;
  final double strokeSize;

  const StrokedText({
    super.key,
    required this.text,
    required this.textSize,
    required this.strokeSize,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text.toUpperCase(),
          maxLines: Dimens.titleStrokeMaxLines,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: textSize,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = strokeSize
              ..color = Colors.black,
          ),
        ),
        Text(
          text.toUpperCase(),
          maxLines: Dimens.titleStrokeMaxLines,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: textSize,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
