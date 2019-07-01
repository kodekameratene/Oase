import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:oase/helpers/asset_helpers.dart';
import 'package:oase/styles.dart';
import 'package:oase/widgets/molecules/KokaButton.dart';
import 'package:oase/widgets/molecules/KokaImg.dart';
import 'package:oase/widgets/molecules/LocationBox.dart';
import 'package:oase/widgets/organisms/KokaCard.dart';
import 'package:oase/widgets/organisms/KokaCardEvent.dart';
import 'package:oase/widgets/organisms/TimeBox.dart';

class ContentViewerPage extends StatelessWidget {
  ContentViewerPage(this.document);

  final DocumentSnapshot document;

  @override
  Widget build(BuildContext context) {
    String category =
        _exists('category') ? document['category'].toString() : null;
    String track = _exists('track') ? document['track'].toString() : null;
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
                  buildImg(context),
                  buildKokaCard(),
                  buildKokaButton(),
                  buildTimeBox(),
                  buildLocationBox(),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      decoration: new BoxDecoration(boxShadow: [
                        new BoxShadow(
                          color: Styles.colorShadowCardMain,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ]),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        color: Colors.white,
                        child: Wrap(
                          children: <Widget>[
                            category != null
                                ? Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Kategori: $category",
                                      style: Styles.textEventCardTimeMinutes,
                                    ),
                                  )
                                : SizedBox.shrink(),
                            track != null
                                ? Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Spor: $track",
                                      style: Styles.textEventCardTimeMinutes,
                                    ),
                                  )
                                : SizedBox.shrink(),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }

  Widget buildLocationBox() =>
      _exists('location') ? LocationBox(document: document) : SizedBox.shrink();

  Widget buildTimeBox() =>
      _exists('startTime') ? TimeBox(document: document) : SizedBox.shrink();

  Widget buildKokaButton() =>
      _exists('url') ? KokaButton(url: document['url']) : SizedBox.shrink();

  Widget buildKokaCard() => _exists('content')
      ? KokaCard(
          document: document,
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
          ))
      : SizedBox.shrink();

  Widget buildKokaCardEvent() => _exists('startTime')
      ? KokaCardEvent(
          document: document,
          short: false,
        )
      : SizedBox.shrink();

  Widget buildImg(context) => _exists('img')
      ? KokaImg(document: document)
      : Container(
          height: 10,
        );

  /// Checks if the document have a field
  /// that matches the provided string.
  /// Returns True if the string does exist,
  /// and False if not.
  _exists(String s) {
    return ((document[s] ?? '') != '');
  }
}
