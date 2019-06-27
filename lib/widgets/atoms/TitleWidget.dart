import 'package:flutter/widgets.dart';
import 'package:oase/styles.dart';

Widget title(String title, bool short) {
  if (short) {
    return Text(title,
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Styles.kokaCardNewsTextHeader);
  }
  return Text(title, style: Styles.kokaCardNewsTextHeader);
}