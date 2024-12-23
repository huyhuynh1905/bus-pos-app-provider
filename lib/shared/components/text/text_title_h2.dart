import 'package:bus_pos_app/generated/fonts.gen.dart';
import 'package:bus_pos_app/shared/res/dimens.dart';
import 'package:bus_pos_app/shared/res/style_text.dart';
import 'package:flutter/material.dart';

class UTextTitleH2 extends StatelessWidget {
  final String textValue;
  final Color textColor;
  final double fontSize;
  final FontWeight? fontWeight;

  const UTextTitleH2({
    super.key,
    required this.textValue,
    required this.textColor,
    this.fontSize = Dimens.titleSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textValue,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: FontFamily.manropeMedium
      ),
    );
  }
}
