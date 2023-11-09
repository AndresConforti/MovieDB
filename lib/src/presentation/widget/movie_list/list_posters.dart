import 'package:flutter/material.dart';

import '../common/stroked_text.dart';

class ListPosters extends StatelessWidget {
  final String posterUrl;
  final String title;

  const ListPosters({
    super.key,
    required this.posterUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: SizedBox.fromSize(
            child: Image.network(
              posterUrl,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Align(
          alignment: FractionalOffset.bottomCenter,
          child: Container(
            color: Colors.black54,
            child: StrokedText(
              text: title,
              textSize: 15,
              strokeSize: 5,
            ),
          ),
        ),
      ],
    );
  }
}
