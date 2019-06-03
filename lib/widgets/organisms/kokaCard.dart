import 'package:Oase/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget kokaCard(
    {String category, String content, String title, onTapAction}) {
  return Card(
    key: Key(category),
    color: Color.fromRGBO(253, 253, 253, 1),
    elevation: 8.0,
    margin: EdgeInsets.all(10),
    child: InkWell(
        splashColor: Styles.colorPrimary,
        child: Container(
            height: 178,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 20, 12, 20),
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: Column(
                      children: <Widget>[
                        Divider(
                          color: Color.fromRGBO(112, 112, 112, 1),
                        ),
                        Text(
                          category,
                          style: TextStyle(
                            fontSize: 28,
                            fontFamily: "Times",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 45, 10, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        constraints: BoxConstraints(maxWidth: 200),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                          child: Text(title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Styles.textCardHeader),
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(maxWidth: 200),
                        child: Text(content,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            softWrap: true,
                            style: Styles.textCardContent),
                      )
                    ],
                  ),
                )
              ],
            )),
        onTap: () => onTapAction()),
  );
}
