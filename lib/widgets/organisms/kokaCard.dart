import 'package:Oase/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget kokaCard(BuildContext context, String title, onTapAction) {
  return Card(
    key: Key(title),
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
                          title,
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
                          child: Text("At vero eos et just ei iusto",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Styles.textCardHeader),
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(maxWidth: 200),
                        child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
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
