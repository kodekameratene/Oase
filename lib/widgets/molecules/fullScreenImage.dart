import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class FullScreenPage extends StatelessWidget {
  FullScreenPage({this.img});
  final String img;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Hero(
          tag: 'imageCVP',
          child: PhotoView(
            imageProvider: NetworkImage(this.img),
          ),
        ),
        onHorizontalDragDown: (details) {
          Navigator.pop(context);
        }
    );
  }
}