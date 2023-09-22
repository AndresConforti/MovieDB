import 'package:flutter/material.dart';
import '../constants/constants.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({super.key});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isLiked = false;
  int countLikes = Constants.defaultLikes;

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
        label: Text(Constants.likedText+countLikes.toString()),
      ),
    );
  }
}
