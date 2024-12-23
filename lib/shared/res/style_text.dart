import 'package:bus_pos_app/generated/fonts.gen.dart';
import 'package:bus_pos_app/shared/res/colors.dart';
import 'package:bus_pos_app/shared/res/dimens.dart';
import 'package:flutter/material.dart';

class Styles {
  static const formFieldText = TextStyle(fontSize: 20, height: 1.25);

  static const textStyleHeading = TextStyle(
    fontFamily: FontFamily.manropeMedium,
    color: AppColors.blackColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.headingSize
  );

  static const textStyleTitle = TextStyle(
    fontFamily: FontFamily.manropeSemiBold,
    color: AppColors.blackColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.headingSize
  );

  static const textStyleSubTitle = TextStyle(
    fontFamily: FontFamily.manropeSemiBold,
    color: AppColors.blackColor,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.normalSize
  );

  static const textStyleBody1 = TextStyle(
    fontFamily: FontFamily.manropeMedium,
    color: AppColors.blackColor,
    fontWeight: FontWeight.w500,
    fontSize: Dimens.normalSize
  );

  static const textStyleBody2 = TextStyle(
    fontFamily: FontFamily.manropeRegular,
    color: AppColors.blackColor,
    fontSize: Dimens.normalSize
  );

  static const textStyleContent = TextStyle(
    fontFamily: FontFamily.manropeMedium,
    color: AppColors.blackColor,
    fontSize: Dimens.contentSize
  );

  static TextStyle textStyleButtonGrad = textStyleSubTitle.copyWith(color: AppColors.whiteColor);
  static TextStyle textStyleButtonOutline = textStyleSubTitle.copyWith(color: AppColors.grayMColor);
  static TextStyle textStyleLabelTextField = textStyleBody1.copyWith(color: AppColors.grayBorderColor);
  static TextStyle textFieldErrorStyle = textStyleContent.copyWith(color: AppColors.coralRed);
}
