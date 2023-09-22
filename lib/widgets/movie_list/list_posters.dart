import 'package:flutter/material.dart';
import '../../utils/dimens.dart';

class ListPosters extends StatelessWidget {
  final String poster;

  const ListPosters({
    super.key,
    required this.poster,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimens.posterHeight,
      padding: const EdgeInsets.only(
        top: Dimens.posterPadding,
        bottom: Dimens.zero,
        right: Dimens.posterPadding,
        left: Dimens.posterPadding,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.posterRadius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Dimens.posterRadius),
        child: SizedBox.fromSize(
          child: Image.network(
            poster,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
