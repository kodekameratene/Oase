import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:oase/styles.dart';

class FullScreenPage extends StatelessWidget {
  FullScreenPage({this.img});
  final String img;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Styles.colorPrimary,
          automaticallyImplyLeading: true,
          leading: IconButton(icon:Icon(Icons.arrow_back),
            onPressed:() => Navigator.pop(context, false),
          )
      ),
      body: Center(
        child: image(context),
      ),
    );
  }

  Widget image(context) {
    return GestureDetector(
        child: Hero(
          tag: 'imageCVP',
          child: PhotoView(
            imageProvider: NetworkImage(this.img),
          ),
        ),
        onVerticalDragEnd: (details) {
          Navigator.pop(context);
        },
    );
  }
}