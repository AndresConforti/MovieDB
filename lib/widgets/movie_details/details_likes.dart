import 'package:flutter/material.dart';
import '../../utils/dimens.dart';
import '../../utils/strings.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({super.key});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isLiked = false;
  int countLikes = Dimens.defaultLikes;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: ElevatedButton.icon(
        onPressed: () {
          setState(() {
            isLiked = !isLiked;
            isLiked ? countLikes++ : countLikes--;
          });
        },
        icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border),
        label: Text(Strings.likedText + countLikes.toString()),
      ),
    );
  }
}
