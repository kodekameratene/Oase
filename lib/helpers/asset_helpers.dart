import 'package:flutter/material.dart';
import 'package:oase/styles.dart';

class AssetHelpers {
  static getAppBarImage() {
    return Image.asset(
      Styles.imgLogoMain,
      width: 180,
      semanticLabel: "SommerOase. 9. til 14. Juli i Fredrikstad",
      fit: BoxFit.scaleDown,
    );
  }
}
