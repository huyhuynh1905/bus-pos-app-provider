import 'package:flutter/material.dart';

class Dimens {
  static Dimens? _current;

  static Dimens get current {
    _current ??= Dimens();
    return _current!;
  }

  void init(BuildContext context) {
    final mediaQueryData = MediaQuery.sizeOf(context);

    screenWidth = mediaQueryData.width;
    screenHeight = mediaQueryData.height;
    topSafePadding = MediaQuery.of(context).padding.top;
    bottomSafePadding = MediaQuery.of(context).padding.bottom;
  }

  late double screenWidth;
  late double screenHeight;
  late double topSafePadding;
  late double bottomSafePadding;

  //padding
  static const double contentPaddingHoz = 15.0;
  static const double contentPaddingVer = 15.0;
  static const double buttonPaddingVer = 5.0;
  static const double scrollviewPaddingHoz = 20;
  static const double topPadding = 45;
  static const double contentPaddingVerSmaller = 6.0;
  static const double contentPaddingSmaller = 5.0;

  //item
  static const double selectedHozPadding = 10.0;
  static const double selectedVerPadding = 4.0;

  //home
  static const double spaXxsPadding = 5;
  static const double spaXsPadding = 8;
  static const double spasPadding = 10;
  static const double spaKPadding = 15;
  static const double spaMPadding = 20;
  static const double spaLPadding = 30;
  static const double spaXlPadding = 40;

  //textsize
  static const double contentSize = 12;
  static const double normalSize = 14;
  static const double subtitleSize = 14;
  static const double titleSize = 16;
  static const double headingSize = 16;
  static const double bigSize = 18;
  static const double bigerSize = 20;

  static const double size_2half = 2.5;
  static const double size_3 = 3;
  static const double size_4 = 4;
  static const double size_5 = 5;
  static const double size_6 = 6;
  static const double size_8 = 8;
  static const double size_10 = 10;
  static const double size_11 = 11;
  static const double size_12 = 12;
  static const double size_13 = 13;
  static const double size_14 = 14;
  static const double size_15 = 15;
  static const double size_16 = 16;
  static const double size_17 = 17;
  static const double size_18 = 18;
  static const double size_20 = 20;
  static const double size_24 = 24;
  static const double size_25 = 25;
  static const double size_28 = 28;
  static const double size_30 = 30;
  static const double size_35 = 35;
  static const double size_40 = 40;
  static const double size_45 = 45;
  static const double size_50 = 50;

  //radius
  static const double smallRadius = 3;
  static const double normalRadius = 5;
  static const double mainCardRadius = 10;
  static const double bigRadius = 15;
  static const double selectedRadius = 100;
  static const double widthItemHome = 165;
  static const double widthItemHomeMin = 175;

  //size
  static const double miniItemWidth = 32;
  static const double miniItemHeight = 32;
  static const double miniItemSize = 32;
  static const double scrolltextSize = 100;
  static const double iconSyncSize = 35;

  //radius
  static const double radiusBottomSheet = 25;
  static const double borderRadiusButton = 5;
  static const double borderRadiusDialog = 8;
  static const double borderRadiusTextField = 5;


}
