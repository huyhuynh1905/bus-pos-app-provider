import 'package:bus_pos_app/generated/fonts.gen.dart';
import 'package:bus_pos_app/shared/res/dimens.dart';
import 'package:flutter/material.dart';

class Styles {
  static const formFieldText = TextStyle(fontSize: 20, height: 1.25);

  static const textStyleHeading = TextStyle(
    fontFamily: FontFamily.manropeMedium,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.headingSize
  );

  static const textStyleTitle = TextStyle(
    fontFamily: FontFamily.manropeSemiBold,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.headingSize
  );

  static const textStyleSubTitle = TextStyle(
    fontFamily: FontFamily.manropeSemiBold,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.normalSize
  );

  static const textStyleBody1 = TextStyle(
    fontFamily: FontFamily.manropeMedium,
    fontWeight: FontWeight.w500,
    fontSize: Dimens.normalSize
  );

  static const textStyleBody2 = TextStyle(
    fontFamily: FontFamily.manropeRegular,
    fontSize: Dimens.normalSize
  );

  static const textStyleContent = TextStyle(
    fontFamily: FontFamily.manropeMedium,
    fontSize: Dimens.normalSize
  );

  static const textStyleSmall = TextStyle(
      fontFamily: FontFamily.manropeMedium,
      fontSize: Dimens.contentSize
  );

}
