import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:oase/helpers/asset_helpers.dart';
import 'package:oase/styles.dart';
import 'package:oase/widgets/molecules/KokaButton.dart';
import 'package:oase/widgets/molecules/fullScreenImage.dart';
import 'package:oase/widgets/organisms/KokaCard.dart';
import 'package:oase/widgets/organisms/KokaCardEvent.dart';
import 'package:oase/widgets/organisms/TimeBox.dart';

class ContentViewerPage extends StatelessWidget {
  ContentViewerPage(this.document);

  final DocumentSnapshot document;

  @override
  Widget build(BuildContext context) {
    print(document.documentID);
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Styles.colorPrimary,
          title: AssetHelpers.getAppBarImage(),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: <Widget>[
                  buildKokaCardEvent(),
                  img(context),
                  buildKokaCard(),
                  buildKokaButton(),
                  buildTimeBox(),
                ],
              )),
        ),
      ),
    );
  }

  Widget buildTimeBox() {
    if (_exists('startTime')) {
      return TimeBox(
        document: document,
      );
    }
    return SizedBox.shrink();
  }

  Widget buildKokaButton() {
    if (_exists('url')) {
      return KokaButton(
        url: document['url'],
      );
    }
    return SizedBox.shrink();
  }

  Widget buildKokaCard() {
    if (_exists('content')) {
      return KokaCard(
        document: document,
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
        ),
      );
    }
    return SizedBox.shrink();
  }

  Widget buildKokaCardEvent() {
    if (_exists('startTime')) {
      return KokaCardEvent(
        document: document,
        short: false,
      );
    }
    return SizedBox.shrink();
  }

  /// Checks if the document have a field
  /// that matches the provided string.
  /// Returns True if the string does exist,
  /// and False if not.
  _exists(String s) {
    return ((document[s] ?? '') != '');
  }

  Widget img(context) {
    if (_exists('img')) {
      return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return FullScreenPage(img: document['img']);
            }));
          },
          child: Container(
            padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
            child: Image.network(
              document['img'],
              fit: BoxFit.cover,
            ),
          ));
    }
    return Container(
      height: 10,
    );
  }
}
