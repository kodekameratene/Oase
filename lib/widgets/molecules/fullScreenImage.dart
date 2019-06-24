import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class FullScreenPage extends StatelessWidget {
  FullScreenPage({this.img});

  final String img;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: image(context),
      ),
    );
  }

  Widget image(context) {
    return PhotoView(heroTag: 'imageCVP',
      imageProvider: NetworkImage(this.img),
    );
  }
}
